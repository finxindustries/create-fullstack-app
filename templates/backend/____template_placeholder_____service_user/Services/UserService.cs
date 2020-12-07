using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Grpc.Core;
using Microsoft.Extensions.Logging;
using ____template_placeholder_____grpc.user;

namespace ____template_placeholder_____service_user
{
	public class UserService : User.UserBase
	{
		private readonly ILogger<UserService> _logger;
		public UserService(ILogger<UserService> logger)
		{
			_logger = logger;
		}
	}
}
