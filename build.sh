#!/bin/bash

function buildNativeLibrary() {
  g++ -I/System/Library/Frameworks/JavaVM.framework/Versions/Current/Headers/ -Isrc/cpp/include -c src/cpp/HelloWorld.cpp -o build/lib/native/HelloWorld.o
  g++ -dynamiclib -o build/lib/libhelloworld.jnilib build/lib/native/HelloWorld.o
}

function buildJniLibrary() {
  javac -d build/lib src/java/com/sevensignal/helloworld/HelloWorld.java
}

function packageLibraryIntoJar() {
  cp build/lib/libhelloworld.jnilib build/lib/com/sevensignal/helloworld
  jar -cf build/helloworld.jar -C build/lib com/sevensignal/helloworld
}

function buildFunctionalTest() {
  javac -cp build/helloworld.jar:. -d build functional-test/java/com/sevensignal/mosfunctionaltester/TestJni.java
}

buildNativeLibrary
buildJniLibrary
packageLibraryIntoJar
buildFunctionalTest
