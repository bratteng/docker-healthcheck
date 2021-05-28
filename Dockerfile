# image used for the healthcheck binary
FROM golang:1.16.4-buster
WORKDIR /go/src/healthcheck/

COPY healthcheck.go .
COPY go.mod .
COPY go.sum .

RUN CGO_ENABLED=0 go build -ldflags '-w -s -extldflags "-static"' -o /healthcheck /go/src/healthcheck/
