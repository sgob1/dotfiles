#!/usr/bin/env bash
set -e

for i in *.woff2;
do
    name="$(basename "${i/.woff2}")";
    echo "Decompressing file $name.woff2";
    woff2_decompress "$name.woff2";
done
