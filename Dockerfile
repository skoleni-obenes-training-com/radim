FROM golang:1.24
COPY src /src

RUN CGO_ENABLED=0 go build -o /server /src/server.go

FROM scratch
COPY --from=0 /server /bin/hello
CMD ["/bin/hello"]
