#!/bin/bash

extensions=(
    "matklad.rust-analyzer"
)

command="code"
for extension in "${extensions[@]}"; do
    command="$command --install-extension $extension"
done
eval $command
