# protoc-gen-swagger-docker

https://github.com/algas/protoc-gen-swagger-docker

You can use `docker run algas/protoc-gen-swagger-docker` instead of setup `protoc` command.

## Usage

1. docker pull
`docker pull algas/protoc-gen-swagger-docker`
1. run protoc-gen-swagger
`docker run --rm -w /work -v $(pwd):work -t algas/protoc-gen-swagger-docker -I. --grpc-gateway_out=logtostderr=true,paths=source_relative:./gen/swagger your/service/v1/your_service.proto`

See the following repository for details.
https://github.com/grpc-ecosystem/grpc-gateway
