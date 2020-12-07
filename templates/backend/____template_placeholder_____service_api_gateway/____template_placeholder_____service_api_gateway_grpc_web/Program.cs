using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Server.Kestrel.Core;
using Microsoft.Extensions.Hosting;

namespace ____template_placeholder_____service_api_gateway_grpc_web
{
	public class Program
	{
		public static void Main(string[] args)
		{
			CreateHostBuilder(args).Build().Run();
		}

		// Additional configuration is required to successfully run gRPC on macOS.
		// For instructions on how to configure Kestrel and gRPC clients on macOS, visit https://go.microsoft.com/fwlink/?linkid=2099682
		public static IHostBuilder CreateHostBuilder(string[] args) =>
			Host.CreateDefaultBuilder(args)
				.ConfigureWebHostDefaults(webBuilder => {
					webBuilder.ConfigureKestrel(options => {
						int.TryParse(Environment.GetEnvironmentVariable("PORT"), out int port);
						if (port == 0) {
							port = 80;
						}

						// Setup an HTTP/1 endpoint without TLS.
						options.Listen(IPAddress.Parse("0.0.0.0"), port, o => o.Protocols =
									HttpProtocols.Http1);
					});
					webBuilder.UseStartup<Startup>();
				});
	}
}
