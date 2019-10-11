get_filename_component(EXERCISENAME ${CMAKE_CURRENT_LIST_DIR} NAME)

file(GLOB_RECURSE SOURCES "*.cpp")
file(GLOB_RECURSE HEADERS "*.h")
file(GLOB_RECURSE SHADERS "*.glsl")

add_executable (smoothing curves.cpp)
target_link_libraries(smoothing ${LIBRARIES})

add_executable (smoothing_test test.cpp)
target_link_libraries(smoothing_test ${LIBRARIES})
