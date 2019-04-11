FROM debian:9-slim

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
			org.label-schema.name="git-sync" \
			org.label-schema.description="A better Git synchronization sidecar container" \
			org.label-schema.url="http://andradaprieto.es" \
			org.label-schema.vcs-ref=$VCS_REF \
			org.label-schema.vcs-url="https://github.com/jandradap/git-sync" \
			org.label-schema.vendor="Jorge Andrada Prieto" \
			org.label-schema.version=$VERSION \
			org.label-schema.schema-version="1.0" \
			maintainer="Jorge Andrada Prieto <jandradap@gmail.com>" \
			org.label-schema.docker.cmd=""

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ca-certificates \
    git \
    openssh-client \
  && DEBIAN_FRONTEND=noninteractive apt-get clean \
  && rm -rf /tmp/* \
    /var/tmp/* \
    /var/lib/apt/lists/* \
    /var/log/apt/* \
    /var/log/dpkg.log \
    /var/log/bootstrap.log \
    /var/log/alternatives.log

COPY rootfs/start.sh /start.sh

RUN chmod 755 /start.sh

VOLUME ["/git"]

CMD ["/start.sh"]
