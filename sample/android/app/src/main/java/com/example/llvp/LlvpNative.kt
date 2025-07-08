package com.example.llvp

class LlvpNative {
    companion object {
        init {
            System.loadLibrary("llvp-jni")
        }
    }
    
    external fun getVersion(): String
    external fun getVersionInfo(): String
} 