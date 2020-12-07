using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using ____template_placeholder_____service_api_gateway_library;

namespace ____template_placeholder_____service_api_gateway_grpc_web
{
	public class Startup
	{
		readonly string AllowAll = "AllowAll";

		// This method gets called by the runtime. Use this method to add services to the container.
		// For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=398940
		public void ConfigureServices(IServiceCollection services)
		{
			services.AddGrpc();

			// FIXME: fix later, don't allow all origins
			services.AddCors(o => o.AddPolicy(AllowAll, builder => {
				builder.AllowAnyOrigin()
					   .AllowAnyMethod()
					   .AllowAnyHeader()
					   .WithExposedHeaders("Grpc-Status", "Grpc-Message", "Grpc-Encoding", "Grpc-Accept-Encoding");
			}));
		}

		// This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
		public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
		{
			if (env.IsDevelopment()) {
				app.UseDeveloperExceptionPage();
			}

			app.UseRouting();

			app.UseGrpcWeb(new GrpcWebOptions { DefaultEnabled = true });
			app.UseCors(AllowAll);

			app.UseEndpoints(endpoints => {
				endpoints.MapGrpcService<ApiGatewayService>().RequireCors(AllowAll);
			});
		}
	}
}
