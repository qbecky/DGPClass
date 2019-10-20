#!/bin/sh
make -C /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/externals/surface_mesh -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/externals/surface_mesh/CMakeScripts/surface_mesh_postBuildPhase.make$CONFIGURATION OBJDIR=$(basename "$OBJECT_FILE_DIR_normal") all
