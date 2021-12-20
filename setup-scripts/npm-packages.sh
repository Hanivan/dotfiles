#!/bin/bash

echo -e "[START]: install npm packages..."

sudo npm i -g `cat ./setup-scripts/resources/npm-packages` || exit 1

echo -e "[FINISHED]: install npm packages\n"
