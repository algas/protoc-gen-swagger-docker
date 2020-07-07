FROM golang:1.14-alpine

WORKDIR /tmp
ENV PROTOBUF_VERSION 3.12.3
RUN apk add --no-cache --update git curl build-base autoconf automake libtool
RUN curl -L -o protobuf.tar.gz https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOBUF_VERSION}/protobuf-cpp-${PROTOBUF_VERSION}.tar.gz
RUN tar xvzf protobuf.tar.gz && \
    cd protobuf-${PROTOBUF_VERSION} && \
    ./autogen.sh && \
    ./configure && \
    make -j 8 && \
    make check && \
    make install && \
    make clean && \
    cd .. && \
    rm -r protobuf-${PROTOBUF_VERSION}
RUN go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
ENTRYPOINT [ "/usr/local/bin/protoc" ]

