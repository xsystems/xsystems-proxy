FROM xsystems/haproxy-letsencrypt:2.0.0
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
