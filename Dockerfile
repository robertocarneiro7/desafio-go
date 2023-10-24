FROM golang:1.19.0-alpine3.16 as builder
WORKDIR /app
COPY . .
RUN go build -o main ./full-cycle.go

FROM scratch
WORKDIR /app
COPY --from=builder /app/main .
CMD ["/app/main"]