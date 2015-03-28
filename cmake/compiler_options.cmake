########################################
## \file   compiler_options.cmake
## \date   01/01/2014
## \brief  Compiler options
########################################


#
# Project-wide compiler flags:
#
if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")

  # Check version. If empty, warn. If too old, error out:
  if ("${CMAKE_CXX_COMPILER_VERSION}" STREQUAL "")
    message(WARNING "GCC compiler version is unknown, proceed at your own risk!")
  elseif (CMAKE_CXX_COMPILER_VERSION VERSION_LESS 4.8)
    message(FATAL_ERROR "GCC compiler version must be at least 4.8 (current version: ${CMAKE_CXX_COMPILER_VERSION})!")
  endif()

  # Set compiler specific flags:
  set(CMAKE_CXX_FLAGS_DEBUG "-Wall -ggdb -std=c++11")
  set(CMAKE_CXX_FLAGS_RELEASE "-w -O3 -std=c++11")

  # Warnings to ignore during C++ debug build:
  set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -Wno-format-extra-args")

elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")

  # Check version. If empty, warn. If too old, error out:
  if ("${CMAKE_CXX_COMPILER_VERSION}" STREQUAL "")
    message(WARNING "Clang compiler version is unknown, proceed at your own risk!")
  elseif (CMAKE_CXX_COMPILER_VERSION VERSION_LESS 3.6)
    message(FATAL_ERROR "Clang compiler version must be at least 3.6 (current version: ${CMAKE_CXX_COMPILER_VERSION})!")
  endif()

  # Set compiler/linker specific flags:
  set(CMAKE_CXX_FLAGS_DEBUG "-Wall -ggdb -std=c++11 -stdlib=libc++")
  set(CMAKE_CXX_FLAGS_RELEASE "-w -O3 -std=c++11 -stdlib=libc++")

else()
  message(WARNING "The '${CMAKE_CXX_COMPILER_ID}' compiler is untested and unsupported, continue at your own risk!")
endif()
