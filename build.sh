#!/bin/bash

BUILD_DIR="build"
BUILD_LIB_DIR="build/lib"
BUILD_NATIVE_DIR="$BUILD_LIB_DIR/native"

function initBuildArtifactFolder() {
  mkdir -p $BUILD_DIR
  mkdir -p $BUILD_LIB_DIR
  mkdir -p $BUILD_NATIVE_DIR
}

function buildNativeLibrary() {
  g++ -I/System/Library/Frameworks/JavaVM.framework/Versions/Current/Headers/ -Isrc/cpp/include -c src/cpp/HelloWorld.cpp -o $BUILD_NATIVE_DIR/HelloWorld.o
  g++ -dynamiclib -o build/lib/libhelloworld.jnilib $BUILD_NATIVE_DIR/HelloWorld.o
}

function buildJniLibrary() {
  javac -d build/lib src/java/com/sevensignal/helloworld/HelloWorld.java
}

function packageLibraryIntoJar() {
  cp $BUILD_LIB_DIR/libhelloworld.jnilib $BUILD_LIB_DIR/com/sevensignal/helloworld
  jar -cf $BUILD_DIR/helloworld.jar -C $BUILD_LIB_DIR com/sevensignal/helloworld
}

function buildFunctionalTest() {
  javac -cp $BUILD_DIR/helloworld.jar:. -d $BUILD_DIR functional-test/java/com/sevensignal/mosfunctionaltester/TestJni.java
}

initBuildArtifactFolder
buildNativeLibrary
buildJniLibrary
packageLibraryIntoJar
buildFunctionalTest
