using System;
using StackExchange.Redis;

namespace SimpleRedis
{
	class Program
	{
		private static string CacheConnection = "";
		static void Main(string[] args)
		{
			IDatabase cache = lazyConnection.Value.GetDatabase();
			Console.WriteLine("Reading Cache : " + cache.StringGet("Session333").ToString());
			Console.WriteLine("Writing Cache : " + cache.StringSet("Session333", "Writing something to Redis " + DateTime.Now.ToLongTimeString()));
			Console.WriteLine("Reading Cache : " + cache.StringGet("Session333").ToString());
			cache.KeyExpire("Session333", DateTime.Now.AddMinutes(1));

			lazyConnection.Value.Dispose();

			Console.WriteLine("Press any key...");
			Console.ReadLine();
		}

		private static Lazy<ConnectionMultiplexer> lazyConnection = new Lazy<ConnectionMultiplexer>(() =>
		{
			return ConnectionMultiplexer.Connect(CacheConnection);
		});

		public static ConnectionMultiplexer Connection
		{
			get
			{
				return lazyConnection.Value;
			}
		}
	}
}
