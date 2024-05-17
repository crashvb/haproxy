FROM crashvb/base:22.04-202404121324@sha256:0514f8f7241795ce2567ec5a20e02fbd062511f6bbf0114504902184793c034d AS parent

FROM haproxy:2.8.9@sha256:0127dc197cf0fd25c27b095cf779c818bc591b88f6a6d4c7ed6ab3e9717679f7
ARG org_opencontainers_image_created=undefined
ARG org_opencontainers_image_revision=undefined
LABEL \
	org.opencontainers.image.authors="Richard Davis <crashvb@gmail.com>" \
	org.opencontainers.image.base.digest="sha256:0127dc197cf0fd25c27b095cf779c818bc591b88f6a6d4c7ed6ab3e9717679f7" \
	org.opencontainers.image.base.name="haproxy:2.8.9" \
	org.opencontainers.image.created="${org_opencontainers_image_created}" \
	org.opencontainers.image.description="Contains haproxy." \
	org.opencontainers.image.licenses="Apache-2.0" \
	org.opencontainers.image.source="https://github.com/crashvb/haproxy-docker" \
	org.opencontainers.image.revision="${org_opencontainers_image_revision}" \
	org.opencontainers.image.title="crashvb/haproxy" \
	org.opencontainers.image.url="https://github.com/crashvb/haproxy-docker"

# hadolint ignore=DL3002
USER root

# Install packages, download files ...
COPY --from=parent /sbin/apt-add-repo /sbin/docker-* /sbin/entrypoint /sbin/healthcheck /sbin/
COPY --from=parent /usr/local/lib/entrypoint.sh /usr/local/lib/
RUN docker-apt ca-certificates curl gettext-base pwgen wget vim

# Configure: bash profile
COPY --from=parent /root/.bashrc /var/lib/haproxy/

# Configure: entrypoint
ENV EP_USER=haproxy
# hadolint ignore=SC2174
RUN mkdir --mode=0755 --parents /etc/entrypoint.d/ /etc/healthcheck.d/

# Configure: healthcheck
COPY healthcheck.haproxy /etc/healthcheck.d/haproxy

HEALTHCHECK CMD /sbin/healthcheck

ENTRYPOINT ["/sbin/entrypoint"]
CMD ["/usr/local/sbin/haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]

