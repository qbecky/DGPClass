#!/bin/sh
make -C /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/CMakeScripts/glfw_objects_postBuildPhase.make$CONFIGURATION OBJDIR=$(basename "$OBJECT_FILE_DIR_normal") all
