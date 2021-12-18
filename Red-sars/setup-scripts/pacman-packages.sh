#!/bin/bash

echo -e "[START]: install general packages..."

yes | sudo pacman -Syu
yes | sudo pacman -Sy --needed --overwrite "*" --nodeps --nodeps `cat ./setup-scripts/resources/pacman-packages` || exit 1

echo -e "[FINISHED]: install general packages\n"
