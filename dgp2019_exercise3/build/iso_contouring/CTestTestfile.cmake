# CMake generated Testfile for 
# Source directory: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/iso_contouring
# Build directory: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test("isotest:test case for mesh 1" "/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/Debug/isotest" "test case for mesh 1")
  set_tests_properties("isotest:test case for mesh 1" PROPERTIES  FAIL_REGULAR_EXPRESSION "No tests ran" LABELS "isotest;mesh1" _BACKTRACE_TRIPLES "/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/cmake/ParseAndAddCatchTests.cmake;193;add_test;/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/cmake/ParseAndAddCatchTests.cmake;222;ParseAndAddCatchTests_ParseFile;/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/iso_contouring/CMakeLists.txt;33;ParseAndAddCatchTests;/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/iso_contouring/CMakeLists.txt;0;")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test("isotest:test case for mesh 1" "/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/Release/isotest" "test case for mesh 1")
  set_tests_properties("isotest:test case for mesh 1" PROPERTIES  FAIL_REGULAR_EXPRESSION "No tests ran" LABELS "isotest;mesh1" _BACKTRACE_TRIPLES "/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/cmake/ParseAndAddCatchTests.cmake;193;add_test;/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/cmake/ParseAndAddCatchTests.cmake;222;ParseAndAddCatchTests_ParseFile;/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/iso_contouring/CMakeLists.txt;33;ParseAndAddCatchTests;/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/iso_contouring/CMakeLists.txt;0;")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test("isotest:test case for mesh 1" "/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/MinSizeRel/isotest" "test case for mesh 1")
  set_tests_properties("isotest:test case for mesh 1" PROPERTIES  FAIL_REGULAR_EXPRESSION "No tests ran" LABELS "isotest;mesh1" _BACKTRACE_TRIPLES "/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/cmake/ParseAndAddCatchTests.cmake;193;add_test;/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/cmake/ParseAndAddCatchTests.cmake;222;ParseAndAddCatchTests_ParseFile;/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/iso_contouring/CMakeLists.txt;33;ParseAndAddCatchTests;/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/iso_contouring/CMakeLists.txt;0;")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test("isotest:test case for mesh 1" "/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/RelWithDebInfo/isotest" "test case for mesh 1")
  set_tests_properties("isotest:test case for mesh 1" PROPERTIES  FAIL_REGULAR_EXPRESSION "No tests ran" LABELS "isotest;mesh1" _BACKTRACE_TRIPLES "/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/cmake/ParseAndAddCatchTests.cmake;193;add_test;/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/cmake/ParseAndAddCatchTests.cmake;222;ParseAndAddCatchTests_ParseFile;/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/iso_contouring/CMakeLists.txt;33;ParseAndAddCatchTests;/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/iso_contouring/CMakeLists.txt;0;")
else()
  add_test("isotest:test case for mesh 1" NOT_AVAILABLE)
endif()
