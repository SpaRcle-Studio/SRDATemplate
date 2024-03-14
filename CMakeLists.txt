cmake_minimum_required(VERSION 3.25)
project(SRDATemplate)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(SR_UTILS_CMAKE_ASSIMP OFF CACHE INTERNAL "" FORCE)
set(SR_UTILS_FMT_HEADER_ONLY ON)

set(SR_UTILS_STATIC_LIBRARY ON)
set(CRYPTIA_STATIC_LIBRARY ON)

add_subdirectory(libs/Utils)
add_subdirectory(libs/Graphics)

add_executable(${CMAKE_PROJECT_NAME} cxx/Innertia.cxx cxx/Window.cxx main.cpp)

target_include_directories(${CMAKE_PROJECT_NAME} PUBLIC inc)

target_link_libraries(${CMAKE_PROJECT_NAME} PUBLIC Utils Graphics)