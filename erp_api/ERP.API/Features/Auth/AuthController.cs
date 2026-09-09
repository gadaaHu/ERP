using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace ERP.API.Features.Auth
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private readonly ERP.API.Shared.Data.AppDbContext _context;

        public AuthController(IConfiguration configuration, ERP.API.Shared.Data.AppDbContext context)
        {
            _configuration = configuration;
            _context = context;
        }

        [HttpPost("login")]
        public IActionResult Login([FromBody] LoginRequest request)
        {
            // For testing: accept any email/password and return a token
            var employee = _context.Employees.FirstOrDefault(e => e.Email.ToLower() == request.Username.ToLower());
            
            if (employee == null)
            {
                employee = _context.Employees.FirstOrDefault();
                if (employee == null) return Unauthorized("No employees found in DB.");
            }

            var token = GenerateJwtToken(employee.Email, employee.FullName, employee.Department, employee.Id);
            return Ok(new { token = token });
        }

        private string GenerateJwtToken(string username, string fullName, string department, int employeeId)
        {
            var securityKey = new SymmetricSecurityKey(
                Encoding.UTF8.GetBytes(_configuration["Jwt:Key"] ?? "super_secret_fallback_key_1234567890"));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            var claims = new[]
            {
                new Claim(ClaimTypes.Name, username),
                new Claim("name", fullName),
                new Claim("department", department),
                new Claim(JwtRegisteredClaimNames.Sub, employeeId.ToString()),
                new Claim(ClaimTypes.Role, "Admin")
            };

            var token = new JwtSecurityToken(
                issuer: _configuration["Jwt:Issuer"] ?? "ERP_API",
                audience: _configuration["Jwt:Audience"] ?? "ERP_Flutter",
                claims: claims,
                expires: DateTime.Now.AddDays(7),
                signingCredentials: credentials);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }

    public class LoginRequest
    {
        public string Username { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;
    }
}
