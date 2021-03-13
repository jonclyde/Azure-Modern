using does_everything_but_does_nothing.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.ApplicationInsights;

namespace does_everything_but_does_nothing.Controllers
{
	public class HomeController : Controller
	{
		private readonly ILogger<HomeController> _logger;
		private TelemetryClient aiClient;

		public HomeController(ILogger<HomeController> logger, TelemetryClient aiClient)
		{
			_logger = logger;
			this.aiClient = aiClient;
		}

		public IActionResult Index()
		{
			_logger.LogCritical("This is a critical logged"); // Writes a critical message at log level 5
			_logger.LogError("This is a error logged"); // Writes an error message at log level 4
			_logger.LogWarning("This is a warning logged"); // Writes a warning message at log level 3
			_logger.LogInformation("This is a information logged"); // Writes an information message at log level 2
			_logger.LogDebug("This is a debug logged"); // Writes a debug message at log level 1
			_logger.LogTrace("This is a trace logged"); // Writes a detailed trace message at log level 0
			return View();
		}

		[HttpPost]
		public ActionResult Like(string button)
		{
			this.aiClient.TrackEvent("LikeClicked");
			ViewBag.Message = "Thank you for your response";
			return View("Index");
		}

		public IActionResult Privacy()
		{
			return View();
		}

		[ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
		public IActionResult Error()
		{
			return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
		}
	}
}
