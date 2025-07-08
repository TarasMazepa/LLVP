#include <jni.h>
#include <string>
#include "version.h"

extern "C" JNIEXPORT jstring JNICALL
Java_com_example_llvp_LlvpNative_getVersion(JNIEnv* env, jobject /* this */) {
    return env->NewStringUTF(llvp::VERSION.c_str());
}

extern "C" JNIEXPORT jstring JNICALL
Java_com_example_llvp_LlvpNative_getVersionInfo(JNIEnv* env, jobject /* this */) {
    std::string info = "LLVP Library Version: " + llvp::VERSION;
    return env->NewStringUTF(info.c_str());
} 