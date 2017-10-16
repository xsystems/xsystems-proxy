FROM xsystems/haproxy-letsencrypt:2.1.0
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg

EXPOSE 80 443 389 9090
