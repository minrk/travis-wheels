
if [ "$TRAVIS_REPO_SLUG" == "pelson/travis-wheels" ] && [ "$TRAVIS_PULL_REQUEST" == "false" ] && [ "$TRAVIS_BRANCH" == "builder" ]; then
    echo "Preparing to push to repo..."
    cd $HOME
    git config --global user.email "travis@travis-ci.org"
    git config --global user.name "travis-ci"
    git clone --quiet --branch=master https://${GH_TOKEN}@github.com/pelson/travis-wheels travis-wheels > /dev/null

    # Commit and Push the Changes
    cd travis-wheels
    cp -Rf ${wheelhouse} ./
    git add -f .
    git status
    git commit -m "Lastest javadoc on successful travis build $TRAVIS_BUILD_NUMBER auto-pushed to gh-pages"
    git status
    # git push -fq origin gh-pages > /dev/null
fi