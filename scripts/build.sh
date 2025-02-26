#!/bin/bash

set -euo pipefail

printf "========================= START $DEV_BUILD_TYPE BUILD ============================ \n"

paths=" - root folder = $DEV_DIR\n"
paths+=" - build folder = $DEV_BUILD_DIR\n"
paths+=" - install folder = $DEV_INSTALL_DIR\n"
paths+=" - glslc folder = $GLSLC_DIR\n"
printf "%b" "$paths\n"

mkdir -p "$DEV_BUILD_DIR/$DEV_BUILD_TYPE" "$DEV_INSTALL_DIR/$DEV_BUILD_TYPE"

cd "$DEV_BUILD_DIR/$DEV_BUILD_TYPE"

printf "========================= START CMAKE ============================ \n"

cmake "$DEV_DIR" \
      -DCMAKE_INSTALL_PREFIX="$DEV_INSTALL_DIR/$DEV_BUILD_TYPE" \
      -DCMAKE_BUILD_TYPE=$DEV_BUILD_TYPE \
      -DCMAKE_BUILD_DIR="$DEV_BUILD_DIR/$DEV_BUILD_TYPE" \
      -DCMAKE_PROJECT_TOP_LEVEL_INCLUDES="$DEV_DIR/cmake/conan_provider.cmake"

cmake --build "$DEV_BUILD_DIR/$DEV_BUILD_TYPE" --config "$DEV_BUILD_TYPE" --target "install"

printf "========================== END CMAKE ============================= \n"

printf "========================== START GLSLC ============================= \n"

"$GLSLC_DIR/glslc" "$DEV_DIR/src/shaders/shader.vert" -o vert.spv
"$GLSLC_DIR/glslc" "$DEV_DIR/src/shaders/shader.frag" -o frag.spv

printf "========================== END GLSLC ============================= \n"

cd "$DEV_DIR"

printf "========================== END $DEV_BUILD_TYPE BUILD ============================ \n"
