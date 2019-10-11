get_filename_component(EXERCISENAME ${CMAKE_CURRENT_LIST_DIR} NAME)

#================================================================
# Iso Contouring
#================================================================

#set(EXERCISENAME DGP_HW3)

add_executable(${EXERCISENAME}
        implicit_functions.cpp
        viewer.cpp
        viewer.h)

# Include all the libraries in surface_mesh
target_link_libraries(${EXERCISENAME} surface_mesh)

# Lastly, additional libraries may have been built for you.  In addition to linking
# against NanoGUI, we need to link against those as well.
target_link_libraries(${EXERCISENAME} nanogui ${NANOGUI_EXTRA_LIBS})


#================================================================
# Unit Test
#================================================================
add_executable(isotest
            isotest.cpp
            viewer.cpp
            viewer.h)
target_link_libraries(isotest Catch2::Catch2 nanogui surface_mesh ${NANOGUI_EXTRA_LIBS})

include(CTest)
include(ParseAndAddCatchTests)
ParseAndAddCatchTests(isotest)