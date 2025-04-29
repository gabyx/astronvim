#!/usr/bin/env bash

set -e
set -u

echo "Format all files ..."
readarray -t luafiles < <(find ./ -name "*.lua")
stylua --config-path .stylelua.toml "${luafiles[@]}"
