FROM    golang:alpine as builder
ARG branch=master
ENV branch=$branch

WORKDIR /go-projects
RUN cd /go-projects && \
    apk update && apk add git curl && \
    git clone -b ${branch} https://github.com/ahmedfathy75/go-http && \
    cd go-http && \
    go build .

FROM alpine:latest
EXPOSE  8080
COPY --from=builder /go-projects/go-http/go-http /
ENTRYPOINT [ "/go-http" ]

