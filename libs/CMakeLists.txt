cmake_minimum_required(VERSION 3.25)
project(SRDATemplate)

if (MINGW)
else()
    if (ANDROID_NDK)
        #TODO: ???????????????? ??? ???????? ??????, ????? ?? ??????????? ? ???????? ??-?? ???????????????? ?????????? (?? ?????? ??????????, ?? ????????? ??)
        #set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror -Wc++17-extensions -Wimplicit-fallthrough -Wc++17-attribute-extensions -Wunused-variable -Wno-unused-variable -Wno-unused-parameter -Wno-unused-function -Wdeprecated-volatile -Wunused-function")
        #set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Werror -Wc++17-extensions -Wimplicit-fallthrough -Wc++17-attribute-extensions -Wunused-variable -Wno-unused-variable -Wno-unused-parameter -Wno-unused-function -Wdeprecated-volatile -Wunused-function")

        #set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror -Wreorder-ctor -Wno-reorder -Wmissing-field-initializers -Wunused-value")
        #set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Werror -Wreorder-ctor -Wno-reorder -Wmissing-field-initializers -Wunused-value")

        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wcomment -Wno-comment -Woverloaded-virtual -Wno-everything -Wmissing-braces -Wunused-private-field -Wno-unused-private-field")
        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wcomment -Wno-comment -Woverloaded-virtual -Wno-everything -Wmissing-braces -Wunused-private-field -Wno-unused-private-field")
    else()
        if (MSVC)
            set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /bigobj /utf-8")
        else ()
            add_compile_options(-fexec-charset=UTF-8)
        endif ()
    endif()
endif()

set(SR_UTILS_CMAKE_ASSIMP ON)
set(SR_UTILS_FMT_HEADER_ONLY ON)

set(SR_UTILS_STATIC_LIBRARY ON)
set(SR_GRAPHICS_STATIC_LIBRARY ON)
set(CRYPTIA_STATIC_LIBRARY ON)

set(SR_UTILS_ASSIMP ON)
set(SR_ICU ON)
set(EVO_VULKAN_STATIC_LIBRARY ON)

add_subdirectory(Utils)
add_subdirectory(Graphics)

