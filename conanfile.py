from conans import ConanFile, tools, CMake

class Conanfile(ConanFile):
    name = "VkToy"
    version = "0.0.1"
    requires = ["sdl/[==2.24]",
                "glad/[==0.1.36]",
                "spdlog/[==1.10.0]",
                "vulkan-headers/[==1.3.239.0]",
                "vulkan-loader/[==1.3.239.0]",
                "imgui/[==1.89]"
                ]
    settings = "os", "compiler", "arch", "build_type"
    exports = "*"
    generators = "cmake_find_package_multi"
    build_policy = "missing"