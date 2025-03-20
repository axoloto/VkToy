file(GLOB SRC "VkToyApp.cpp" "Utils.cpp" "*.hpp")

add_executable(VkToyApp ${SRC})
set_target_properties(VkToyApp PROPERTIES FOLDER app)

if("${CMAKE_BUILD_TYPE}" STREQUAL "Debug")
    target_compile_definitions(VkToyApp PUBLIC DEBUG_BUILD)
endif()

target_compile_definitions(VkToyApp PRIVATE SHADER_DIR=${SHADER_DIR})

find_package(glfw3 REQUIRED)
find_package(Vulkan REQUIRED)
find_package(spdlog REQUIRED)
find_package(glm REQUIRED)
#add_subdirectory(imgui_backend)

target_link_libraries(VkToyApp PRIVATE Vulkan::Vulkan glfw spdlog::spdlog glm::glm)

install(TARGETS VkToyApp RUNTIME DESTINATION bin)