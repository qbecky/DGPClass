# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/cmake-build-debug

# Utility rule file for Continuous.

# Include the progress variables for this target.
include externals/catch2/CMakeFiles/Continuous.dir/progress.make

externals/catch2/CMakeFiles/Continuous:
	cd /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/cmake-build-debug/externals/catch2 && /Applications/CLion.app/Contents/bin/cmake/mac/bin/ctest -D Continuous

Continuous: externals/catch2/CMakeFiles/Continuous
Continuous: externals/catch2/CMakeFiles/Continuous.dir/build.make

.PHONY : Continuous

# Rule to build all files generated by this target.
externals/catch2/CMakeFiles/Continuous.dir/build: Continuous

.PHONY : externals/catch2/CMakeFiles/Continuous.dir/build

externals/catch2/CMakeFiles/Continuous.dir/clean:
	cd /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/cmake-build-debug/externals/catch2 && $(CMAKE_COMMAND) -P CMakeFiles/Continuous.dir/cmake_clean.cmake
.PHONY : externals/catch2/CMakeFiles/Continuous.dir/clean

externals/catch2/CMakeFiles/Continuous.dir/depend:
	cd /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3 /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/externals/catch2 /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/cmake-build-debug /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/cmake-build-debug/externals/catch2 /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/cmake-build-debug/externals/catch2/CMakeFiles/Continuous.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : externals/catch2/CMakeFiles/Continuous.dir/depend
