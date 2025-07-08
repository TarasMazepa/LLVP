cmake_minimum_required(VERSION 3.10)

project(llvp VERSION 1.0.0 LANGUAGES CXX)

# Set C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Create header-only library
add_library(llvp INTERFACE)

# Set include directories
target_include_directories(llvp INTERFACE
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
    $<INSTALL_INTERFACE:include>
)

# Set compile definitions
target_compile_definitions(llvp INTERFACE
    LLVP_VERSION="${PROJECT_VERSION}"
)

# Install configuration
install(TARGETS llvp
    EXPORT llvpTargets
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
    INCLUDES DESTINATION include
)

# Install headers
install(FILES version.h
    DESTINATION include
)

# Install export set
install(EXPORT llvpTargets
    FILE llvpTargets.cmake
    NAMESPACE llvp::
    DESTINATION lib/cmake/llvp
)

# Add test executable
add_executable(test_version test_version.cpp)
target_link_libraries(test_version llvp) 