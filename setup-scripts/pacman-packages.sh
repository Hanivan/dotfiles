#!/bin/bash

echo -e "[START]: install general packages..."

yes "\n" | sudo pacman -Syu
yes "\n" | sudo pacman -Sy --needed --overwrite "*" --nodeps --nodeps `cat ./setup-scripts/resources/pacman-packages` || exit 1

echo -e "[FINISHED]: install general packages\n"
