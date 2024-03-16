cmake_minimum_required(VERSION 3.25)
project(SRDATemplate)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

message(STATUS "${CMAKE_PROJECT_NAME}: CMake version is ${CMAKE_VERSION}")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DSR_DLL_EXPORTS")

add_definitions(
        -DSR_ICU
        -DSR_USE_IMGUI
        -DSR_UTILS_ASSIMP
        -DSR_USE_IMGUIZMO
        -DSR_USE_IMGUI_NODE_EDITOR
        -DSR_USE_VULKAN
        -DSR_DLL_EXPORTS
        -DSR_SUPPORT_PARALLEL
        -DSR_CXX_20
)

if (UNIX)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fcompare-debug-second -w -Wno-deprecated")
endif()

if (UNIX AND CMAKE_BUILD_TYPE STREQUAL "Debug")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-pie -no-pie -g3")
endif()

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DSR_DLL_EXPORTS -DSR_UTILS_ASSIMP")

add_subdirectory(libs)

add_executable(${CMAKE_PROJECT_NAME} cxx/SRDATemplate.cxx main.cpp)

target_include_directories(${CMAKE_PROJECT_NAME} PUBLIC inc)

add_custom_command(TARGET ${CMAKE_PROJECT_NAME}
    POST_BUILD
    COMMAND ${CMAKE_COMMAND}
    -DTARGET_NAME=${CMAKE_PROJECT_NAME}
    -DTARGET_PATH=${CMAKE_BINARY_DIR}
    -P ${CMAKE_SOURCE_DIR}/cmake/PostBuild.cmake
    COMMENT "Running SpaRcle Template for Desktop Applications post-build script..."
    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
)

target_link_libraries(${CMAKE_PROJECT_NAME} PUBLIC Utils Graphics)