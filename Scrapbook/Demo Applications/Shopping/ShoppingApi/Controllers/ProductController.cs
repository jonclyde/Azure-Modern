using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using MongoDB.Driver;
using ShoppingApi.Models;
using ShoppingApp.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShoppingApi.Controllers
{
	[ApiController]
	[Route("[controller]")]
	public class ProductController
	{
		private readonly ProductContext _context;
		private readonly ILogger<ProductController> _logger;

		public ProductController(ProductContext context, ILogger<ProductController> logger)
		{
			_context = context ?? throw new ArgumentNullException(nameof(context));
			_logger = logger ?? throw new ArgumentNullException(nameof(context));
		}

		[HttpGet]
		public async Task<IEnumerable<Product>> Get()
		{
			return await _context
				.Products
				.Find(p => true)
				.ToListAsync();
			
		}
	}
}
