FROM golang:1.6
MAINTAINER \
  ITisOpen <patrice@itisopen.net>

COPY ./ /opt/app/src
WORKDIR /opt/app/src

RUN chmod g=u /etc/passwd
ENTRYPOINT [ "run.sh" ]
USER 1001
