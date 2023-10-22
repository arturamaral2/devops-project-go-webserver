FROM golang:latest

COPY dockerize /go/dockerize/

ENV APP_HOME /go/dockerize/

WORKDIR $APP_HOME

EXPOSE 3306

RUN go mod init dockerize && go mod tidy

RUN go build -o dockerize

CMD ["./dockerize"]
