DC := docker-compose 
DCFLAGS := -p "____template_placeholder____"
D := docker

# os detection
ifeq ($(OS),Windows_NT)
    HOST := windows
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
        HOST := linux
    endif
    ifeq ($(UNAME_S),Darwin)
        HOST := osx
    endif
endif

default: build run

build: build_backend

build_backend:
ifeq ($(HOST),windows)
	$(D) build -f ../backend/____template_placeholder_____service_api_gateway/____template_placeholder_____service_api_gateway/Dockerfile -t ____template-placeholder____-api-gateway-service ../backend/____template_placeholder_____service_api_gateway/
	$(D) build -f ../backend/____template_placeholder_____service_api_gateway/____template_placeholder_____service_api_gateway_grpc_web/Dockerfile -t ____template-placeholder____-api-gateway-grpc-web-service ../backend/____template_placeholder_____service_api_gateway/
	$(D) build -f ../backend/____template_placeholder_____service_user/Dockerfile -t ____template-placeholder____-user-service ../backend/____template_placeholder_____service_user/
	$(D) build -f ../backend/____template_placeholder_____service_authentication_user/Dockerfile -t ____template-placeholder____-authentication-user-service ../backend/____template_placeholder_____service_authentication_user/
	$(D) build -f ../backend/____template_placeholder_____service_email/Dockerfile -t ____template-placeholder____-email-service ../backend/____template_placeholder_____service_email/
else
	# use parallel building on hosts supporting wait command
	$(D) build -f ../backend/____template_placeholder_____service_api_gateway/____template_placeholder_____service_api_gateway/Dockerfile -t ____template-placeholder____-api-gateway-service ../backend/____template_placeholder_____service_api_gateway/ & \
	$(D) build -f ../backend/____template_placeholder_____service_api_gateway/____template_placeholder_____service_api_gateway_grpc_web/Dockerfile -t ____template-placeholder____-api-gateway-grpc-web-service ../backend/____template_placeholder_____service_api_gateway/ & \
	$(D) build -f ../backend/____template_placeholder_____service_user/Dockerfile -t ____template-placeholder____-user-service ../backend/____template_placeholder_____service_user/ & \
	$(D) build -f ../backend/____template_placeholder_____service_authentication_user/Dockerfile -t ____template-placeholder____-authentication-user-service ../backend/____template_placeholder_____service_authentication_user/ & \
	$(D) build -f ../backend/____template_placeholder_____service_email/Dockerfile -t ____template-placeholder____-email-service ../backend/____template_placeholder_____service_email/ & \
	wait
endif

run:
	$(DC) $(DCFLAGS) up

clean:
	# kill and remove docker containers
	$(DC) $(DCFLAGS) kill
	$(DC) $(DCFLAGS) rm --force
	# remove docker images
	$(D) rmi --force ____template-placeholder____-api-gateway-service
	$(D) rmi --force ____template-placeholder____-api-gateway-grpc-web-service
	$(D) rmi --force ____template-placeholder____-user-service
	$(D) rmi --force ____template-placeholder____-authentication-user-service
	$(D) rmi --force ____template-placeholder____-email-service

clean_db:
	# requires "make clean" first
	# remove docker volumes for db
	$(D) volume rm ____template_placeholder_____dbdata_user_service_local
