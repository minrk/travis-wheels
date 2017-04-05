travis-wheels
=============

**This package is deprecated**

Since Python has manylinux wheels now and packages like numpy, scipy, and matplotlib all build them, there is little need to maintain up-to-date wheels for Travis, as package maintainers are already doing it.

Original README:

A proof-of-concept for the generation and storage travis-ci applicable Python wheels.

The primary work for this repo is done in the [builder](https://github.com/pelson/travis-wheels/tree/builder) branch which, when updated,
triggers travis-ci to build binary wheels for various packages (this is currently only a proof of concept, so not many just yet).
Travis then commits these wheels to the master's "wheelhouse" directory and pushes them back to github.

The original motivation for this experiment was to efficiently include package dependencies into a travis-ci build. Dependencies
such as numpy and scipy are slow to build and so a common workaround is to use the package manager's versions (apt-get).
This comes with its own set of problems, including the fact that often the packaged versions are out of date.
Other than the wheel based approach made available with this repo, another solution may be to make use of a binary
  distribution of Python, such as that available from Continuum Analytics' "Anaconda". See also https://gist.github.com/dan-blanchard/7045057.


