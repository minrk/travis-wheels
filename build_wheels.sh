#!/bin/sh

set -e

test -d ${wheelhouse} || mkdir -p ${wheelhouse}

pip wheel --wheel-dir=${wheelhouse} -r requirements.txt

ls ${wheelhouse}

