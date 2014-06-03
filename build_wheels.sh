mkdir -p ${wheelhouse}

pip wheel --wheel-dir=${wheelhouse} ./simplejson

ls ${wheelhouse}

