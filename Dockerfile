FROM node:6.3.0-slim
MAINTAINER Olivier Berthonneau <olivier.berthonneau@nanocloud.com>

ENV WORKDIR /opt/back

RUN npm install -g pm2

RUN mkdir -p $WORKDIR
WORKDIR $WORKDIR

COPY package.json /tmp/package.json
RUN cd /tmp && npm install
RUN cp -a /tmp/node_modules $WORKDIR

COPY ./ $WORKDIR

EXPOSE 1337

CMD pm2 start app.js -- --prod && pm2 logs

# Openshift port
ENV HOME $WORKDIR
COPY uid_entrypoint /
RUN chgrp -R 0 $WORKDIR && \
    chmod -R g=u $WORKDIR && \
    chmod g=u /etc/passwd
ENTRYPOINT [ "/uid_entrypoint" ]
USER 1001
