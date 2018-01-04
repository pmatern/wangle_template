cmake_minimum_required (VERSION 2.6)
project (__RENAME__)
# The version number.
set (app_VERSION_MAJOR 1)
set (app_VERSION_MINOR 0)
set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/)


 
# configure a header file to pass some of the CMake settings
# to the source code
configure_file (
  "${PROJECT_SOURCE_DIR}/app_config.h.in"
  "${PROJECT_BINARY_DIR}/app_config.h"
  )
 
include(CheckCXXCompilerFlag)

CHECK_CXX_COMPILER_FLAG("-std=c++14" COMPILER_SUPPORTS_CXX14)
if(COMPILER_SUPPORTS_CXX14)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")
else()
    message(STATUS "The compiler ${CMAKE_CXX_COMPILER} has no C++14 support. Please use a different C++ compiler.")
endif()

# add the binary tree to the search path for include files
# so that we will find app_config.h
include_directories("${PROJECT_BINARY_DIR}")

# add the executable
add_executable(__RENAME__ main.cc)

find_package(Folly REQUIRED)
find_package(Wangle REQUIRED)
find_package(gflags REQUIRED)
find_package(OpenSSL REQUIRED)
find_package(Glog REQUIRED)
find_package(Folly REQUIRED)
find_package(Boost REQUIRED COMPONENTS system thread filesystem regex context)
find_package(OpenSSL REQUIRED)
find_package(Glog REQUIRED)
find_package(Gflags REQUIRED)
find_package(Libevent REQUIRED)
find_package(DoubleConversion REQUIRED)
find_package(Threads REQUIRED)
find_package(Libdl)
if (UNIX AND NOT APPLE)
  find_package(Librt)
endif()


include_directories(
    ${FOLLY_INCLUDE_DIR}
    ${WANGLE_INCLUDE_DIR}
    ${GFLAGS_INCLUDE_DIRS}
    ${GLOG_INCLUDE_DIRS}

    #${OPENSSL_INCLUDE_DIR}
    #${Boost_INCLUDE_DIR}
    #${LIBEVENT_INCLUDE_DIRS}
    #${DOUBLE_CONVERSION_INCLUDE_DIRS}
)

target_link_libraries(__RENAME__ 
    ${WANGLE_LIBRARIES}
    ${FOLLY_LIBRARIES}
    ${Boost_LIBRARIES}
    ${OPENSSL_LIBRARIES}
    ${GLOG_LIBRARIES}
    ${GFLAGS_LIBRARIES}
    ${LIBEVENT_LIBRARIES}
    ${DOUBLE_CONVERSION_LIBRARIES}
    ${LIBDL_LIBRARIES}
    ${LIBRT_LIBRARIES}
)

