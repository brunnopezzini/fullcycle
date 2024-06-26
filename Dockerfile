FROM golang:latest AS BUILDER

WORKDIR /app

COPY hello.go .
COPY go.mod .

RUN go build -o server .

FROM scratch

COPY --from=BUILDER /app/server ./server

CMD [ "./server" ]