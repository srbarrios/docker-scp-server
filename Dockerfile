FROM alpine:3.10

RUN apk add --no-cache bash openssh openssh-keygen

RUN echo -e "test\ntest\n" | adduser -u 1000 -h /home/data data

ENV AUTHORIZED_KEYS_FILE /authorized_keys

COPY sshd_config /etc/ssh/sshd_config
COPY entrypoint.sh /

CMD ["/entrypoint.sh"]
EXPOSE 22
VOLUME /home/data
VOLUME /var/local/etc/ssh
