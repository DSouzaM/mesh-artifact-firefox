Mesh Firefox base Docker image
==============================

This repository is a combination of the Jess Frazelle's Firefox
[Dockerfile](https://github.com/jessfraz/dockerfiles/tree/master/firefox)
and a pair of Firefox 83.0 builds -- one with jemalloc and one
without.

NOTE: The Firefox builds are checked in inside `opt/`. To meet GitHub size requirements, `opt/firefox-83.0-{nojemalloc, jemalloc}/lib/firefox-83.0/libxul.so` had to be split into smaller files using `split(1)`. These files can be reassembled using TODO
