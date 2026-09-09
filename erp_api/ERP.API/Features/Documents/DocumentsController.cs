
using ERP.API.Shared.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace ERP.API.Features.Documents;

[ApiController]
[Route("api/[controller]")]
public class DocumentsController : ControllerBase
{
    private readonly IRepository<Document> _repository;

    public DocumentsController(IRepository<Document> repository)
    {
        _repository = repository;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<Document>>> GetAll()
    {
        var items = await _repository.GetAllAsync();
        return Ok(items);
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<Document>> GetById(int id)
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
            TotalDocuments = items.Count(), 
            TotalSize = items.Sum(d => d.FileSize),
            Active = items.Count(d => d.Status == "Active")
        });
    }

    [HttpPost]
    public async Task<ActionResult<Document>> Create(Document entity)
    {
        var created = await _repository.AddAsync(entity);
        return CreatedAtAction(nameof(GetById), new { id = created.Id }, created);
    }

    [HttpPut("{id}")]
    public async Task<IActionResult> Update(int id, Document entity)
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
