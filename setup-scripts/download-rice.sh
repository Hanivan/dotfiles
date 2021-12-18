#!/bin/bash

theme_name=$1

echo -e "[INFO]: Downloading \"$theme_name\" rice..."

[ ! -z $theme_name ] && git submodule update --init --depth 1 --recursive ./rices/$theme_name && cd ./rices/$theme_name
