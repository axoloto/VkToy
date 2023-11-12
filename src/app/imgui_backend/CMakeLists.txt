file(GLOB SRC "*.cpp" "*.h")

add_compile_definitions(IMGUI_IMPL_VULKAN_LOADER_GLAD)

find_package(imgui REQUIRED CONFIG)
find_package(SDL2 REQUIRED CONFIG)
find_package(VulkanHeaders REQUIRED CONFIG)
find_package(Vulkan REQUIRED CONFIG)

add_library(imgui_backend ${SRC})

target_include_directories(imgui_backend INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})

target_link_libraries(imgui_backend PUBLIC imgui::imgui SDL2::SDL2 Vulkan::Headers Vulkan::Vulkan)

install(TARGETS imgui_backend DESTINATION lib)