#!/bin/bash

pushd opt/firefox-83.0-nojemalloc/lib/firefox-83.0/
cat libxul_part?? >> libxul.so
popd

pushd opt/firefox-83.0-jemalloc/lib/firefox-83.0/
cat libxul_part?? >> libxul.so
popd
