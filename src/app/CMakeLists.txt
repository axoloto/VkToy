
add_executable(VkToyApp "VkToyApp.cpp")
set_target_properties(VkToyApp PROPERTIES FOLDER app)

find_package(glfw3 REQUIRED)
find_package(Vulkan REQUIRED)
#add_subdirectory(imgui_backend)

target_link_libraries(VkToyApp PRIVATE Vulkan::Vulkan glfw)

install(TARGETS VkToyApp RUNTIME DESTINATION bin)