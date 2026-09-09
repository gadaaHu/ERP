
using ERP.API.Shared.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace ERP.API.Features.Services;

[ApiController]
[Route("api/[controller]")]
public class ServicesController : ControllerBase
{
    private readonly IRepository<ServiceRequest> _repository;

    public ServicesController(IRepository<ServiceRequest> repository)
    {
        _repository = repository;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<ServiceRequest>>> GetAll()
    {
        var items = await _repository.GetAllAsync();
        return Ok(items);
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<ServiceRequest>> GetById(int id)
    {
        var item = await _repository.GetByIdAsync(id);
        if (item == null) return NotFound();
        return Ok(item);
    }

    [HttpGet("stats")]
    public async Task<ActionResult> GetStats()
    {
        var items = await _repository.GetAllAsync();
        return Ok(new { 
            TotalRequests = items.Count(), 
            Open = items.Count(s => s.Status == "Open" || s.Status == "InProgress"),
            Resolved = items.Count(s => s.Status == "Resolved")
        });
    }

    [HttpPost]
    public async Task<ActionResult<ServiceRequest>> Create(ServiceRequest entity)
    {
        var created = await _repository.AddAsync(entity);
        return CreatedAtAction(nameof(GetById), new { id = created.Id }, created);
    }

    [HttpPut("{id}")]
    public async Task<IActionResult> Update(int id, ServiceRequest entity)
    {
        if (id != entity.Id) return BadRequest();
        await _repository.UpdateAsync(entity);
        return NoContent();
    }

    [HttpDelete("{id}")]
    public async Task<IActionResult> Delete(int id)
    {
        await _repository.DeleteAsync(id);
        return NoContent();
    }
}
