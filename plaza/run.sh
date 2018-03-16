#!/bin/env sh

SRCDIR=/opt/app/src

_log() {
  echo "--- '$*' ---"
}

_log "init script starting"

_log "copying go dependencies install script on shared volume"
cp $SRCDIR/install.sh /go/src/github.com/Nanocloud/nanocloud/plaza/install.sh

_log "installing go dependencies on shared volume"
cd /go/src/github.com/Nanocloud/nanocloud/plaza
./install.sh

_log "copying plaza source code on shared volume"
cp $SRCDIR/install.sh /go/src/github.com/Nanocloud/nanocloud/plaza

_log "building plaza executable on shared volume"
./build.sh

