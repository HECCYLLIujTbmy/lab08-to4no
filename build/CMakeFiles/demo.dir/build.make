# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.24

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/kali/HECCYLLIujTbmy/workspace/projects/lab08-to4no

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/kali/HECCYLLIujTbmy/workspace/projects/lab08-to4no/build

# Include any dependencies generated for this target.
include CMakeFiles/demo.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/demo.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/demo.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/demo.dir/flags.make

CMakeFiles/demo.dir/demo/main.cpp.o: CMakeFiles/demo.dir/flags.make
CMakeFiles/demo.dir/demo/main.cpp.o: /home/kali/HECCYLLIujTbmy/workspace/projects/lab08-to4no/demo/main.cpp
CMakeFiles/demo.dir/demo/main.cpp.o: CMakeFiles/demo.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kali/HECCYLLIujTbmy/workspace/projects/lab08-to4no/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/demo.dir/demo/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/demo.dir/demo/main.cpp.o -MF CMakeFiles/demo.dir/demo/main.cpp.o.d -o CMakeFiles/demo.dir/demo/main.cpp.o -c /home/kali/HECCYLLIujTbmy/workspace/projects/lab08-to4no/demo/main.cpp

CMakeFiles/demo.dir/demo/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/demo.dir/demo/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kali/HECCYLLIujTbmy/workspace/projects/lab08-to4no/demo/main.cpp > CMakeFiles/demo.dir/demo/main.cpp.i

CMakeFiles/demo.dir/demo/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/demo.dir/demo/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kali/HECCYLLIujTbmy/workspace/projects/lab08-to4no/demo/main.cpp -o CMakeFiles/demo.dir/demo/main.cpp.s

# Object files for target demo
demo_OBJECTS = \
"CMakeFiles/demo.dir/demo/main.cpp.o"

# External object files for target demo
demo_EXTERNAL_OBJECTS =

demo: CMakeFiles/demo.dir/demo/main.cpp.o
demo: CMakeFiles/demo.dir/build.make
demo: libprint.a
demo: CMakeFiles/demo.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/kali/HECCYLLIujTbmy/workspace/projects/lab08-to4no/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable demo"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/demo.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/demo.dir/build: demo
.PHONY : CMakeFiles/demo.dir/build

CMakeFiles/demo.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/demo.dir/cmake_clean.cmake
.PHONY : CMakeFiles/demo.dir/clean

CMakeFiles/demo.dir/depend:
	cd /home/kali/HECCYLLIujTbmy/workspace/projects/lab08-to4no/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kali/HECCYLLIujTbmy/workspace/projects/lab08-to4no /home/kali/HECCYLLIujTbmy/workspace/projects/lab08-to4no /home/kali/HECCYLLIujTbmy/workspace/projects/lab08-to4no/build /home/kali/HECCYLLIujTbmy/workspace/projects/lab08-to4no/build /home/kali/HECCYLLIujTbmy/workspace/projects/lab08-to4no/build/CMakeFiles/demo.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/demo.dir/depend

