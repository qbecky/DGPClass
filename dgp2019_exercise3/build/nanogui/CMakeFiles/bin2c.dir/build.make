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
CMAKE_COMMAND = /opt/local/bin/cmake

# The command to remove a file.
RM = /opt/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/qbecker/Documents/Fall2019/DGP/DGPClass/dgp2019_exercise3

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/qbecker/Documents/Fall2019/DGP/DGPClass/dgp2019_exercise3/build

# Include any dependencies generated for this target.
include nanogui/CMakeFiles/bin2c.dir/depend.make

# Include the progress variables for this target.
include nanogui/CMakeFiles/bin2c.dir/progress.make

# Include the compile flags for this target's objects.
include nanogui/CMakeFiles/bin2c.dir/flags.make

nanogui/CMakeFiles/bin2c.dir/resources/bin2c.c.o: nanogui/CMakeFiles/bin2c.dir/flags.make
nanogui/CMakeFiles/bin2c.dir/resources/bin2c.c.o: ../externals/nanogui/resources/bin2c.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/qbecker/Documents/Fall2019/DGP/DGPClass/dgp2019_exercise3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object nanogui/CMakeFiles/bin2c.dir/resources/bin2c.c.o"
	cd /Users/qbecker/Documents/Fall2019/DGP/DGPClass/dgp2019_exercise3/build/nanogui && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bin2c.dir/resources/bin2c.c.o   -c /Users/qbecker/Documents/Fall2019/DGP/DGPClass/dgp2019_exercise3/externals/nanogui/resources/bin2c.c

nanogui/CMakeFiles/bin2c.dir/resources/bin2c.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bin2c.dir/resources/bin2c.c.i"
	cd /Users/qbecker/Documents/Fall2019/DGP/DGPClass/dgp2019_exercise3/build/nanogui && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/qbecker/Documents/Fall2019/DGP/DGPClass/dgp2019_exercise3/externals/nanogui/resources/bin2c.c > CMakeFiles/bin2c.dir/resources/bin2c.c.i

nanogui/CMakeFiles/bin2c.dir/resources/bin2c.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bin2c.dir/resources/bin2c.c.s"
	cd /Users/qbecker/Documents/Fall2019/DGP/DGPClass/dgp2019_exercise3/build/nanogui && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/qbecker/Documents/Fall2019/DGP/DGPClass/dgp2019_exercise3/externals/nanogui/resources/bin2c.c -o CMakeFiles/bin2c.dir/resources/bin2c.c.s

# Object files for target bin2c
bin2c_OBJECTS = \
"CMakeFiles/bin2c.dir/resources/bin2c.c.o"

# External object files for target bin2c
bin2c_EXTERNAL_OBJECTS =

nanogui/bin2c: nanogui/CMakeFiles/bin2c.dir/resources/bin2c.c.o
nanogui/bin2c: nanogui/CMakeFiles/bin2c.dir/build.make
nanogui/bin2c: nanogui/CMakeFiles/bin2c.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/qbecker/Documents/Fall2019/DGP/DGPClass/dgp2019_exercise3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable bin2c"
	cd /Users/qbecker/Documents/Fall2019/DGP/DGPClass/dgp2019_exercise3/build/nanogui && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bin2c.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
nanogui/CMakeFiles/bin2c.dir/build: nanogui/bin2c

.PHONY : nanogui/CMakeFiles/bin2c.dir/build

nanogui/CMakeFiles/bin2c.dir/clean:
	cd /Users/qbecker/Documents/Fall2019/DGP/DGPClass/dgp2019_exercise3/build/nanogui && $(CMAKE_COMMAND) -P CMakeFiles/bin2c.dir/cmake_clean.cmake
.PHONY : nanogui/CMakeFiles/bin2c.dir/clean

nanogui/CMakeFiles/bin2c.dir/depend:
	cd /Users/qbecker/Documents/Fall2019/DGP/DGPClass/dgp2019_exercise3/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/qbecker/Documents/Fall2019/DGP/DGPClass/dgp2019_exercise3 /Users/qbecker/Documents/Fall2019/DGP/DGPClass/dgp2019_exercise3/externals/nanogui /Users/qbecker/Documents/Fall2019/DGP/DGPClass/dgp2019_exercise3/build /Users/qbecker/Documents/Fall2019/DGP/DGPClass/dgp2019_exercise3/build/nanogui /Users/qbecker/Documents/Fall2019/DGP/DGPClass/dgp2019_exercise3/build/nanogui/CMakeFiles/bin2c.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : nanogui/CMakeFiles/bin2c.dir/depend

