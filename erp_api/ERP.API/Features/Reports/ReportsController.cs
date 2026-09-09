
using ERP.API.Shared.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace ERP.API.Features.Reports;

[ApiController]
[Route("api/[controller]")]
public class ReportsController : ControllerBase
{
    private readonly IRepository<Report> _repository;

    public ReportsController(IRepository<Report> repository)
    {
        _repository = repository;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<Report>>> GetAll()
    {
        var items = await _repository.GetAllAsync();
        return Ok(items);
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<Report>> GetById(int id)
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
            TotalReports = items.Count(), 
            Completed = items.Count(r => r.Status == "Completed" || r.Status == "Approved"),
            Draft = items.Count(r => r.Status == "Draft")
        });
    }

    [HttpPost]
    public async Task<ActionResult<Report>> Create(Report entity)
    {
        var created = await _repository.AddAsync(entity);
        return CreatedAtAction(nameof(GetById), new { id = created.Id }, created);
    }

    [HttpPut("{id}")]
    public async Task<IActionResult> Update(int id, Report entity)
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
