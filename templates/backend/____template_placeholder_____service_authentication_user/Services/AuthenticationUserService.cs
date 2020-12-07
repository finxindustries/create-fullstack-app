using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Grpc.Core;
using Microsoft.Extensions.Logging;
using ____template_placeholder_____grpc.authentication_user;

namespace ____template_placeholder_____service_authentication_user
{
	public class AuthenticationUserService : AuthenticationUser.AuthenticationUserBase
	{
		private readonly ILogger<AuthenticationUserService> _logger;
		public AuthenticationUserService(ILogger<AuthenticationUserService> logger)
		{
			_logger = logger;
		}
	}
}
