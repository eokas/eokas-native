
set(TARGET_NAME "eokas-native")
set(TARGET_DIR "${CMAKE_CURRENT_SOURCE_DIR}/native")


set(HEADER_DIRS
        "${CMAKE_CURRENT_SOURCE_DIR}/deps/eokas-base/include"
        "${TARGET_DIR}"
)
set(LIBRARY_DIRS
        "${CMAKE_CURRENT_SOURCE_DIR}/deps/eokas-base/lib/${OS_NAME}/${CMAKE_BUILD_TYPE}"
)


file(GLOB HEADER_FILES
        "${TARGET_DIR}/*.h"
)
file(GLOB SOURCE_FILES
        "${TARGET_DIR}/*.cpp"
        "${TARGET_DIR}/${OS_NAME}/*.cpp"
)
set(LIBRARY_FILES
        eokas-base
)
message("headers: " ${HEADER_FILES})
message("sources: " ${SOURCE_FILES})
message("libraries: " ${LIBRARY_FILES})


add_library(${TARGET_NAME} STATIC ${SOURCE_FILES})
target_include_directories(${TARGET_NAME} PUBLIC ${HEADER_DIRS})
target_link_directories(${TARGET_NAME} PUBLIC ${LIBRARY_DIRS})
target_link_libraries(${TARGET_NAME} ${LIBRARY_FILES})


install(FILES ${HEADER_FILES} DESTINATION include/${TARGET_NAME})
install(TARGETS ${TARGET_NAME} DESTINATION lib/${OS_NAME}/${CMAKE_BUILD_TYPE})


eokas_test_setup(${TARGET_NAME})
