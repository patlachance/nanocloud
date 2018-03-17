#!/bin/sh

SRCDIR=$PWD

_log() {
  echo "--- '$*' ---"
}

_log "init script starting"

_log "fixing /etc/passwd"
if ! whoami &> /dev/null; then
  if [ -w /etc/passwd ]; then
  echo "${USER_NAME:-default}:x:$(id -u):0:${USER_NAME:-default}
  user:${HOME}:/sbin/nologin" >> /etc/passwd
  fi
fi

_log "copying go dependencies install script on shared volume"
cp $SRCDIR/install.sh /go/src/github.com/Nanocloud/nanocloud/plaza/install.sh

_log "installing go dependencies on shared volume"
cd /go/src/github.com/Nanocloud/nanocloud/plaza
./install.sh

_log "copying plaza source code on shared volume"
cp -a $SRCDIR/* /go/src/github.com/Nanocloud/nanocloud/plaza

_log "building plaza executable on shared volume"
./build.sh

exit $?
