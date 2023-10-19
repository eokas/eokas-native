cmake_minimum_required(VERSION 3.22)

## Project name and version
project(eokas-native VERSION 1.0)

include(${CMAKE_CURRENT_LIST_DIR}/cmake/eokas.cmake)

cmake_host_system_information(RESULT OS_NAME QUERY OS_NAME)
message("OS_NNAME = " ${OS_NAME})

## C++ Standard and Options
# Visual Studio 2022 doesn't support C++20
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)
# set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OPENMP_SIMD_FLAGS} -march=armv8-a+simd")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=armv8-a+simd")


## Project Information
message("project name: " ${PROJECT_NAME})
message("project source dir: " ${PROJECT_SOURCE_DIR})
message("project binary dir: " ${PROJECT_BINARY_DIR})

# Includes Directories
set(HEADER_DIRS
    "deps/eokas-base/include"
    "src/"
)
set(LIBRARY_DIRS
    "deps/eokas-base/lib/${OS_NAME}/${CMAKE_BUILD_TYPE}"
)


## Main Library Target
file(GLOB HEADER_FILES "src/*.h")
file(GLOB SOURCE_FILES "src/*.cpp" "src/${OS_NAME}/*.cpp")
set(LIBRARY_FILES eokas-base)

message("headers: " ${HEADER_FILES})
message("sources: " ${SOURCE_FILES})
message("libraries: " ${LIBRARY_FILES})

add_library(${PROJECT_NAME} STATIC ${SOURCE_FILES})
target_include_directories(${PROJECT_NAME} PUBLIC ${HEADER_DIRS})
target_link_directories(${PROJECT_NAME} PUBLIC ${LIBRARY_DIRS})
target_link_libraries(${PROJECT_NAME} ${LIBRARY_FILES})


## Install
install(FILES ${HEADER_FILES} DESTINATION include/${PROJECT_NAME})
install(TARGETS ${PROJECT_NAME} DESTINATION lib/${OS_NAME}/${CMAKE_BUILD_TYPE})


## Test
eokas_test_setup(${PROJECT_NAME})
