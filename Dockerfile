FROM golang:1.20-alpine AS builder

WORKDIR /app

RUN go mod init fullcycle/hello-world


COPY . .

RUN go build -o fullcycle

FROM scratch

COPY --from=builder /app/fullcycle /fullcycle

CMD ["/fullcycle"]
