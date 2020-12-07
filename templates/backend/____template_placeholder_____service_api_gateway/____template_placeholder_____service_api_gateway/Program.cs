using System;
using System.Net;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Server.Kestrel.Core;
using Microsoft.Extensions.Hosting;

namespace ____template_placeholder_____service_api_gateway
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
						// FIXME: enable SSL/TLS
						AppContext.SetSwitch(
								"System.Net.Http.SocketsHttpHandler.Http2UnencryptedSupport", true);

						int.TryParse(Environment.GetEnvironmentVariable("PORT"), out int port);
						if (port == 0) {
							port = 80;
						}

						// Setup an HTTP/2 endpoint without TLS.
						options.Listen(IPAddress.Parse("0.0.0.0"), port, o => o.Protocols =
									HttpProtocols.Http2);
					});
					webBuilder.UseStartup<Startup>();
				});
	}
}
