
using ERP.API.Shared.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace ERP.API.Features.Assets;

[ApiController]
[Route("api/[controller]")]
public class AssetsController : ControllerBase
{
    private readonly IRepository<Asset> _repository;

    public AssetsController(IRepository<Asset> repository)
    {
        _repository = repository;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<Asset>>> GetAll()
    {
        var items = await _repository.GetAllAsync();
        return Ok(items);
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<Asset>> GetById(int id)
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
            TotalAssets = items.Count(), 
            TotalValue = items.Sum(a => a.CurrentValue),
            Active = items.Count(a => a.Status == "Active")
        });
    }

    [HttpPost]
    public async Task<ActionResult<Asset>> Create(Asset entity)
    {
        var created = await _repository.AddAsync(entity);
        return CreatedAtAction(nameof(GetById), new { id = created.Id }, created);
    }

    [HttpPut("{id}")]
    public async Task<IActionResult> Update(int id, Asset entity)
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
