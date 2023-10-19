cmake_minimum_required(VERSION 3.22)

macro(eokas_import_library LIBRARY_NAME LIBRARY_PATH, LIBRARY_TAG)
    include(FetchContent)

    FetchContent_Declare(
            ${LIBRARY_NAME}
            GIT_REPOSITORY ${LIBRARY_PATH}
            GIT_TAG ${LIBRARY_TAG}
    )
endmacro()

macro(eokas_using_library LIBRARY_NAME...)
    include(FetchContent)

    FetchContent_MakeAvailable(${LIBRARY_NAME})

    message("Import library: ${LIBRARY_NAME} => ${LIBRARY_PATH}:${LIBRARY_TAG}")
    message("${LIBRARY_NAME}_HEADER_DIR: ${${LIBRARY_NAME}_HEADER_DIR}")
    message("${LIBRARY_NAME}_SOURCE_DIR: ${${LIBRARY_NAME}_SOURCE_DIR}")

    list(APPEND CMAKE_MODULE_PATH "${${LIBRARY_NAME}_HEADER_DIR}")
    list(APPEND CMAKE_MODULE_PATH "${${LIBRARY_NAME}_SOURCE_DIR}")
endmacro()
