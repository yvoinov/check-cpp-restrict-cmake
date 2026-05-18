# check-cpp-restrict-cmake
[![License](https://img.shields.io/badge/License-MIT--Clause-blue.svg)](https://github.com/yvoinov/sparc-t4-recognition-cmake/blob/main/LICENSE)

## CMake module to check and set C++ restrict attribute value

The restrict attribute (extension) has been supported for many years, starting with the C++11 standard. However, not only is this extension poorly documented, but there's no test macro or way to detect its support.

This CMake module is designed to correct this obvious defect.

Based on [this module](https://github.com/yvoinov/check-cpp-restrict) the similar solution was written for CMake.

To use, add include to CMakeLists.txt before targets as shown below (an example) then call function and check result:

```sh
include(cmake_check_cpp_restrict.cmake)

check_cpp_restrict()

if(CPP_RESTRICT)
  add_compile_definitions(
    CPP_RESTRICT=${CPP_RESTRICT}
  )
else()
  add_compile_definitions(
    CPP_RESTRICT=
  )
endif()
```
Then the macro is simply inserted into the code (example):

```c
	void Foo(int *CPP_RESTRICT Bar)
```
