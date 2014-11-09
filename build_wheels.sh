#!/bin/bash

set -e

test -d ${wheelhouse} || mkdir -p ${wheelhouse}

requirements=requirements.txt

if [[ "${TRAVIS_PYTHON_VERSION}" == "2.6" ]]; then
  requirements=requirements26.txt
fi

pip wheel -f travis-wheels/wheelhouse --wheel-dir=${wheelhouse} -r $requirements

ls ${wheelhouse}

