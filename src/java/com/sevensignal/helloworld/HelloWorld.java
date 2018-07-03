package com.sevensignal.helloworld;

import java.io.File;

public class HelloWorld {

  static {
    System.loadLibrary("HelloWorld");
    // File lib = new File("/Users/aaron/work/Sandbox/JniApp/ForMac/build/lib/libhelloworld.jnilib"; // + System.mapLibraryName("HelloWorld"));
    // System.load("/Users/aaron/work/Sandbox/JniApp/ForMac/build/lib/libhelloworld.jnilib");
  }

  public native void print();

  public static void main(String[] argv) {
    new HelloWorld().print();
  }
}
