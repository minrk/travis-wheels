#!/bin/bash

set -e

export BUILD_BRANCH="builder"
export PUBLISH_BRANCH="master"
export REPO="$TRAVIS_REPO_SLUG"

if [ "x$TRAVIS_PULL_REQUEST" == "xfalse" ] && [ "x$TRAVIS_BRANCH" == "x$BUILD_BRANCH" ]; then

    echo "Pushing to ${PUBLISH_BRANCH}."

    git config --global user.email "travis@travis-ci.org"
    git config --global user.name "travis-ci"
    
    cd travis-wheels
    git rm -rf wheelhouse
    cp -Rf ${wheelhouse} wheelhouse
    git add --all wheelhouse
    git status
    if [ -z $(git diff HEAD) ]; then
      echo "Nothing to commit"
      exit 0
    fi
    git commit -m "Latest wheels build by travis-ci."
    git push
else
    echo "Not pushing to ${PUBLISH_BRANCH}. In PR: ${TRAVIS_PULL_REQUEST}; Branch: ${TRAVIS_BRANCH};"
fi