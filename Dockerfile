FROM alpine:3.3

ENV MICROMDM_VERSION=v1.3.1

RUN apk --no-cache add curl zip && \
    curl -L https://github.com/micromdm/micromdm/releases/download/${MICROMDM_VERSION}/micromdm_${MICROMDM_VERSION}.zip -o /micromdm.zip && \
    unzip /micromdm.zip && \
    mv /build/linux/micromdm / && \
    rm -fr /build /micromdm.zip && \
    chmod a+x /micromdm && \
    apk del curl zip

COPY run.sh /run.sh

RUN mkdir /config /certs /repo && \
  chmod +x /run.sh

EXPOSE 80 443 8080

VOLUME ["/config","/certs","/repo"]

CMD ["/run.sh"]
