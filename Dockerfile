FROM alpine:latest
RUN apk upgrade --no-cache && apk add --no-cache ca-certificates iptables iproute2 ip6tables tailscale nfs-utils bash && \
    rm /sbin/halt /sbin/poweroff /sbin/reboot

ADD entry.sh /usr/local/bin/entry.sh

ENTRYPOINT ["/usr/local/bin/entry.sh"]

COPY --from=build-env /go/bin/* /usr/local/bin/
# For compat with the previous run.sh, although ideally you should be
# using build_docker.sh which sets an entrypoint for the image.
RUN mkdir /tailscale && ln -s /usr/local/bin/containerboot /tailscale/run.sh
