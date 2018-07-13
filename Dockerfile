FROM alpine:3.3

ENV MICROMDM_VERSION=v1.3.1

RUN apk --no-cache add curl && \
    curl -L https://github.com/micromdm/micromdm/releases/download/${MICROMDM_VERSION}/micromdm-linux-amd64 -o /micromdm && \
    chmod a+x /micromdm && \
    apk del curl

COPY run.sh /run.sh

RUN mkdir /config /certs /repo && \
  chmod +x /run.sh

EXPOSE 80 443 8080

VOLUME ["/config","/certs","/repo"]

CMD ["/run.sh"]
