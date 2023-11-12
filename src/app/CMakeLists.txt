
add_executable(VkToyApp "VkToyApp.cpp")
set_target_properties(VkToyApp PROPERTIES FOLDER app)

find_package(Vulkan REQUIRED CONFIG)
add_subdirectory(imgui_backend)

target_link_libraries(VkToyApp PRIVATE imgui_backend Vulkan::Vulkan)

#find_package(OpenGL REQUIRED CONFIG)
#target_link_libraries(VkToyApp PRIVATE OpenGL)

install(TARGETS VkToyApp RUNTIME DESTINATION bin)