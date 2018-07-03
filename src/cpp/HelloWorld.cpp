#include <jni.h>
#include <iostream>
#include "HelloWorld.h"
using namespace std;

JNIEXPORT void JNICALL
Java_com_sevensignal_helloworld_HelloWorld_print(JNIEnv *, jobject){
    cout << "Oh JNI, how cumbersome you are!\n";
    return;
}
