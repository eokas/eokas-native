cmake_minimum_required(VERSION 3.22)

project(eokas-native VERSION 1.0)

include(${CMAKE_CURRENT_LIST_DIR}/cmake/eokas.cmake)

cmake_host_system_information(RESULT OS_NAME QUERY OS_NAME)
message("OS_NNAME = " ${OS_NAME})


set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)
# set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OPENMP_SIMD_FLAGS} -march=armv8-a+simd")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=armv8-a+simd")


include("native.cmake")
include("app.cmake")

