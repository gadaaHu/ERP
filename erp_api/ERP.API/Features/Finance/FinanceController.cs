
using ERP.API.Shared.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace ERP.API.Features.Finance;

[ApiController]
[Route("api/[controller]")]
public class FinanceController : ControllerBase
{
    private readonly IRepository<Transaction> _repository;

    public FinanceController(IRepository<Transaction> repository)
    {
        _repository = repository;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<Transaction>>> GetAll()
    {
        var items = await _repository.GetAllAsync();
        return Ok(items);
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<Transaction>> GetById(int id)
    {
        var item = await _repository.GetByIdAsync(id);
        if (item == null) return NotFound();
        return Ok(item);
    }

    [HttpGet("stats")]
    public async Task<ActionResult> GetStats()
    {
        var items = await _repository.GetAllAsync();
        var income = items.Where(t => t.Type == "Income").Sum(t => t.Amount);
        var expense = items.Where(t => t.Type == "Expense").Sum(t => t.Amount);
        return Ok(new { TotalRevenue = income, TotalExpenses = expense, NetIncome = income - expense });
    }

    [HttpPost]
    public async Task<ActionResult<Transaction>> Create(Transaction entity)
    {
        var created = await _repository.AddAsync(entity);
        return CreatedAtAction(nameof(GetById), new { id = created.Id }, created);
    }

    [HttpPut("{id}")]
    public async Task<IActionResult> Update(int id, Transaction entity)
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
