FROM micromdm/micromdm:1.2.0-5-ge3348a9

ENV MICROMDM_VERSION=v1.3.1

COPY run.sh /run.sh

RUN mkdir /config /certs /repo && \
  chmod +x /run.sh

EXPOSE 80 443 8080

VOLUME ["/config","/certs","/repo"]

CMD ["/run.sh"]
