using System;
using System.Threading.Tasks;
using Grpc.Core;
using Microsoft.Extensions.Logging;
using ____template_placeholder_____grpc.api_gateway;
using ____template_placeholder_____grpc.authentication_user;
using ____template_placeholder_____grpc.models.user;
using Grpc.Net.Client;

namespace ____template_placeholder_____service_api_gateway_library
{
	public class ApiGatewayService : ApiGateway.ApiGatewayBase
	{
		private readonly ILogger<ApiGatewayService> _logger;
		private readonly AuthenticationUser.AuthenticationUserClient _authenticationUserClient;

		public ApiGatewayService(ILogger<ApiGatewayService> logger)
		{
			// AUTHENTICATION_USER_SERVICE
			int authenticationUserPort = GetHostAndPortForService("AUTHENTICATION_USER_SERVICE", out string authenticationUserHost);
			// FIXME: enable SSL/TLS
			var authenticationUserChannel = GrpcChannel.ForAddress("http://" + authenticationUserHost + ":" + authenticationUserPort);
			_authenticationUserClient = new AuthenticationUser.AuthenticationUserClient(authenticationUserChannel);

			_logger = logger;
		}

		private int GetHostAndPortForService(string service, out string host)
		{
			int.TryParse(Environment.GetEnvironmentVariable(service + "_PORT"), out int port);
			if (port == 0) {
				throw new SystemException(service + "_PORT env var was not set!");
			}
			host = "";
			if (string.IsNullOrWhiteSpace(Environment.GetEnvironmentVariable(service + "_HOST"))) {
				throw new SystemException(service + "_HOST env var was not set!");
			}
			host = Environment.GetEnvironmentVariable(service + "_HOST");
			return port;
		}

		public override Task<LoginResponse> LoginUser(LoginRequest request, ServerCallContext context)
		{
			// TODO: implement login user
			return Task.FromResult(new LoginResponse {
				Jwt = "gjj299j9jjd9",
				User = new User {
					FirstName = "TestFirstName",
					LastName = "TestLastName",
					Email = "test.test@test.com",
					Phone = "0101010101"
				},
			}); ;
		}

		public override Task<SignupResponse> SignupUser(SignupRequest request, ServerCallContext context)
		{
			// TODO: implement signup user
			return Task.FromResult(new SignupResponse {
				Jwt = "gjj299j9jjd9",
				User = new User {
					FirstName = "TestFirstName",
					LastName = "TestLastName",
					Email = "test.test@test.com",
					Phone = "0101010101"
				},
			});
		}
	}
}
