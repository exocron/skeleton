cmake_minimum_required(VERSION 3.12)

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

project(dc33_fw_s32k148)

add_executable(dc33_fw_s32k148 main.c)
target_include_directories(dc33_fw_s32k148 PRIVATE "$ENV{NXP_SDK}/platform/devices/S32K148/include")
target_compile_options(dc33_fw_s32k148 PRIVATE -nostdlib)
target_link_options(dc33_fw_s32k148 PRIVATE -nostdlib)

install(TARGETS dc33_fw_s32k148 DESTINATION bin)
