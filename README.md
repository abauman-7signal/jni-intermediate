### Building the source
    $ ./build.sh

### Running the functional test
    $ cd build
    $ java -cp .:helloworld.jar -Djava.library.path=lib com.sevensignal.mosfunctionaltester.TestJni
