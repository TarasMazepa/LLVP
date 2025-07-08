cmake_minimum_required(VERSION 3.22.1)

project(llvp-android)

# Add the LLVP library
add_library(llvp INTERFACE)
target_include_directories(llvp INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../lib
)

# Create the JNI library
add_library(llvp-jni SHARED
    llvp_jni.cpp
)

# Link against the LLVP library
target_link_libraries(llvp-jni llvp)

# Set C++ standard
set_target_properties(llvp-jni PROPERTIES
    CXX_STANDARD 11
    CXX_STANDARD_REQUIRED YES
) 