#!/bin/bash

set -euo pipefail

if [[ "$OSTYPE" == "win32" ]] || [[ "$OSTYPE" == "msys" ]]; then
    ./install/"$DEV_BUILD_TYPE"/bin/VkToyApp.exe
else
    ./install/"$DEV_BUILD_TYPE"/bin/VkToyApp
fi