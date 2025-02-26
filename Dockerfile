FROM alpine:latest
RUN apk upgrade --no-cache && apk add --no-cache ca-certificates iptables iproute2 ip6tables tailscale nfs-utils bash && \
    rm /sbin/halt /sbin/poweroff /sbin/reboot
