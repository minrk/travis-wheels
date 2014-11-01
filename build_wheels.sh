#!/bin/sh

set -e

test -d ${wheelhouse} || mkdir -p ${wheelhouse}

pip wheel -f travis-wheels/wheelhouse --wheel-dir=${wheelhouse} -r requirements.txt

ls ${wheelhouse}

