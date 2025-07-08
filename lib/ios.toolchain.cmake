# iOS toolchain file for CMake
# This file configures CMake to build for iOS targets

set(CMAKE_SYSTEM_NAME iOS)
set(CMAKE_OSX_DEPLOYMENT_TARGET "12.0" CACHE STRING "Minimum iOS deployment version")

# Specify the cross compiler
set(CMAKE_C_COMPILER clang)
set(CMAKE_CXX_COMPILER clang++)

# Set the target architecture
if(CMAKE_OSX_ARCHITECTURES)
    set(CMAKE_OSX_ARCHITECTURES ${CMAKE_OSX_ARCHITECTURES} CACHE STRING "Build architectures for Mac OS X" FORCE)
endif()

# Set the iOS SDK
if(DEFINED ENV{IPHONEOS_DEPLOYMENT_TARGET})
    set(CMAKE_OSX_DEPLOYMENT_TARGET $ENV{IPHONEOS_DEPLOYMENT_TARGET} CACHE STRING "Minimum iOS deployment version")
endif()

# Set the iOS platform
if(DEFINED ENV{CMAKE_OSX_SYSROOT})
    set(CMAKE_OSX_SYSROOT $ENV{CMAKE_OSX_SYSROOT} CACHE STRING "iOS SDK path")
else()
    # Try to find the iOS SDK automatically
    execute_process(
        COMMAND xcrun --sdk iphoneos --show-sdk-path
        OUTPUT_VARIABLE CMAKE_OSX_SYSROOT
        OUTPUT_STRIP_TRAILING_WHITESPACE
    )
    set(CMAKE_OSX_SYSROOT ${CMAKE_OSX_SYSROOT} CACHE STRING "iOS SDK path")
endif()

# Set compiler flags
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fembed-bitcode")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fembed-bitcode")

# Set linker flags
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -fembed-bitcode")
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -fembed-bitcode")

# Disable searching for programs in the build host directories
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# Only search for libraries and headers in the target directories
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

# Set Xcode specific attributes
set(CMAKE_XCODE_ATTRIBUTE_ONLY_ACTIVE_ARCH NO)
set(CMAKE_XCODE_ATTRIBUTE_ENABLE_BITCODE YES)
set(CMAKE_XCODE_ATTRIBUTE_BITCODE_GENERATION_MODE bitcode)
set(CMAKE_XCODE_ATTRIBUTE_VALIDATE_PRODUCT YES)

# For header-only libraries, we need to ensure proper installation
set(CMAKE_IOS_INSTALL_COMBINED YES) 