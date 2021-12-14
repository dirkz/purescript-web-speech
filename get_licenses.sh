#!/usr/bin/env bash

# Note: the `awk` part is to cut out only the package name
for dep in $(spago ls deps | awk '{print $1}')
do
    cat $(find ".spago/${dep}" -iname 'LICENSE')
done
