FROM alpine:3.8

RUN  apk --no-cache add opendkim=2.10.3-r8 supervisor

RUN mkdir /run/opendkim/ && chmod 777 /run/opendkim/ \
    && echo "*.* -/dev/stdout" >> /etc/syslog.conf

COPY ./supervisord.conf /etc/supervisor/supervisord.conf
COPY ./kill_supervisor.py /kill_supervisor.py

EXPOSE 8891

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
