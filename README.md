### Running native code in Java
Uses JNI to call a library that implements code that runs on the native platform.

Based on http://mrjoelkemp.com/2012/01/getting-started-with-jni-and-c-on-osx-lion/.

See https://github.com/abauman-7signal/jni-basic for source code that more closely
matches the above example.

This project takes the above example and goes further by
* Packaging the HelloWorld JNI code into a JAR
* Creating the native interface to be part of Java package
  Note: The signature of the C++ methods must reflect the name of the Java package
  that wraps the C++ library.


### Prerequisites
* JDK is installed
* GNU g++ is installed. This was already the case since I was developing on a Mac.


### Building the source
    $ ./build.sh


### Running the functional test
    $ cd build
    $ java -cp .:helloworld.jar -Djava.library.path=lib com.sevensignal.mosfunctionaltester.TestJni

should print the following to standard out: `Oh JNI, how cumbersome you are!`

Note: Java needs to know the location of the JAR file and the path to the library.
