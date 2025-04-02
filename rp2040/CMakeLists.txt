cmake_minimum_required(VERSION 3.12)

include("$ENV{PICO_SDK_PATH}/external/pico_sdk_import.cmake")

project(dc33_fw_rp2040)

pico_sdk_init()

add_executable(dc33_fw_rp2040 main.c)
target_link_libraries(dc33_fw_rp2040 pico_stdlib)
pico_enable_stdio_usb(dc33_fw_rp2040 1)
pico_enable_stdio_uart(dc33_fw_rp2040 0)
pico_add_extra_outputs(dc33_fw_rp2040)

install(TARGETS dc33_fw_rp2040 DESTINATION bin)
install(
  FILES
  ${output_path}$<IF:$<BOOL:$<TARGET_PROPERTY:dc33_fw_rp2040,OUTPUT_NAME>>,$<TARGET_PROPERTY:dc33_fw_rp2040,OUTPUT_NAME>,$<TARGET_PROPERTY:dc33_fw_rp2040,NAME>>.uf2
  DESTINATION
  bin
)
