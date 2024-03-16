message(STATUS "Post build script: ${CMAKE_BINARY_DIR}")

macro(SRCopyFileToAppInternal dir file)
    message(STATUS "SRCopyFileToApp: target = ${file}")

    if(EXISTS "${CMAKE_BINARY_DIR}/${dir}/${file}")
        message(STATUS "Copy file ${CMAKE_BINARY_DIR}/${dir}/${file}")

        file(COPY ${CMAKE_BINARY_DIR}/${dir}/${file} DESTINATION ${CMAKE_BINARY_DIR}/Debug)
        file(COPY ${CMAKE_BINARY_DIR}/${dir}/${file} DESTINATION ${CMAKE_BINARY_DIR}/Release)
        file(COPY ${CMAKE_BINARY_DIR}/${dir}/${file} DESTINATION ${CMAKE_BINARY_DIR})
    endif()

    if(EXISTS "${CMAKE_BINARY_DIR}/${dir}/Debug/${file}")
        message(STATUS "Copy file ${CMAKE_BINARY_DIR}/${dir}/Debug/${file}")

        file(COPY ${CMAKE_BINARY_DIR}/${dir}/Debug/${file} DESTINATION ${CMAKE_BINARY_DIR}/Debug)
        file(COPY ${CMAKE_BINARY_DIR}/${dir}/Debug/${file} DESTINATION ${CMAKE_BINARY_DIR}/Release)
        file(COPY ${CMAKE_BINARY_DIR}/${dir}/Debug/${file} DESTINATION ${CMAKE_BINARY_DIR})
    endif()

    if(EXISTS "${CMAKE_BINARY_DIR}/${dir}/Release/${file}")
        message(STATUS "Copy file ${CMAKE_BINARY_DIR}/${dir}/Release/${file}")

        file(COPY ${CMAKE_BINARY_DIR}/${dir}/Release/${file} DESTINATION ${CMAKE_BINARY_DIR}/Debug)
        file(COPY ${CMAKE_BINARY_DIR}/${dir}/Release/${file} DESTINATION ${CMAKE_BINARY_DIR}/Release)
        file(COPY ${CMAKE_BINARY_DIR}/${dir}/Release/${file} DESTINATION ${CMAKE_BINARY_DIR})
    endif()

    if(EXISTS "${CMAKE_BINARY_DIR}/lib/${file}")
        message(STATUS "Copy file ${CMAKE_BINARY_DIR}/lib/${file}")

        file(COPY ${CMAKE_BINARY_DIR}/lib/${file} DESTINATION ${CMAKE_BINARY_DIR}/Debug)
        file(COPY ${CMAKE_BINARY_DIR}/lib/${file} DESTINATION ${CMAKE_BINARY_DIR}/Release)
        file(COPY ${CMAKE_BINARY_DIR}/lib/${file} DESTINATION ${CMAKE_BINARY_DIR})
    endif()

    if(EXISTS "${CMAKE_BINARY_DIR}/lib/Release/${file}")
        message(STATUS "Copy file ${CMAKE_BINARY_DIR}/lib/${file}")

        file(COPY ${CMAKE_BINARY_DIR}/lib/Release/${file} DESTINATION ${CMAKE_BINARY_DIR}/Debug)
        file(COPY ${CMAKE_BINARY_DIR}/lib/Release/${file} DESTINATION ${CMAKE_BINARY_DIR}/Release)
        file(COPY ${CMAKE_BINARY_DIR}/lib/Release/${file} DESTINATION ${CMAKE_BINARY_DIR})
    endif()

    if(EXISTS "${CMAKE_BINARY_DIR}/lib/Debug/${file}")
        message(STATUS "Copy file ${CMAKE_BINARY_DIR}/lib/${file}")

        file(COPY ${CMAKE_BINARY_DIR}/lib/Debug/${file} DESTINATION ${CMAKE_BINARY_DIR}/Debug)
        file(COPY ${CMAKE_BINARY_DIR}/lib/Debug/${file} DESTINATION ${CMAKE_BINARY_DIR}/Release)
        file(COPY ${CMAKE_BINARY_DIR}/lib/Debug/${file} DESTINATION ${CMAKE_BINARY_DIR})
    endif()
endmacro()

macro(SRCopyFileToApp dir file)
    SRCopyFileToAppInternal(${dir} ${file})
    SRCopyFileToAppInternal(${dir} lib${file})
endmacro()

SRCopyFileToApp("libs/Utils" "Utils.dll")
SRCopyFileToApp("libs/Utils" "Utilsd.dll")

SRCopyFileToApp("libs/Graphics" "freetype.dll")
SRCopyFileToApp("libs/Graphics" "freetyped.dll")
