# build stage
FROM golang:alpine AS build-env
WORKDIR /src
ADD hello.go /src
RUN go build hello.go && pwd && ls -l

# final stage
FROM alpine
COPY --from=build-env /src/hello /
ENTRYPOINT ./hello
