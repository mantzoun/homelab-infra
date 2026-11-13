#!/bin/bash

set -euo pipefail
shopt -s dotglob nullglob

export IFS=$'\n'

for file in *.env
do
    [[ -f "$file" ]] || continue
    [[  "$file" != *.enc.env ]] || continue

    echo Encrypting $file
    out="${file%.env}.enc.env"
    sops encrypt --input-type dotenv --output-type dotenv --output $out $file
done
