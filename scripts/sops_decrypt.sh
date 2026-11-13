#!/bin/bash

set -euo pipefail
shopt -s dotglob nullglob

export IFS=$'\n'

for file in *.enc.env
do
    [[ -f "$file" ]] || continue

    echo Decrypting $file
    out="${file%.enc.env}.env"
    sops decrypt --input-type dotenv --output-type dotenv --output $out $file
done
