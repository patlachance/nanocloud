FROM debian:8.3
MAINTAINER Romain Soufflet <romain.soufflet@nanocloud.com>

RUN apt-get update && \
    apt-get -y install samba

COPY smb.conf /etc/samba/smb.conf

EXPOSE 445
EXPOSE 445/udp
EXPOSE 9090

RUN mkdir /opt/Users

RUN chgrp -Rh root /var/log/samba && \
    chmod g+rwx /var/log/samba

USER 1001

CMD ["sh", "-c", "smbd -D; nmbd -D; /opt/plaza/plaza"]
