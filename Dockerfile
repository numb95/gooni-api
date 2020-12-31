FROM golang:1.15 as builder
WORKDIR /app/src
COPY . .
RUN go build -o /app/output/gooni-api

FROM alpine:3.12.3
WORKDIR /bin
COPY --from=builder /app/output/gooni-api .
CMD ["/bin/gooni-api"]
