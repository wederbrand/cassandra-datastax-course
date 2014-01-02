class project
========

Building and Running on Unix
-----

1. Install Java 7 JDK.  Validate it with `java -version`   It should be 1.7.  Validate the compiler as well with `javac -version`

2. Install Maven

3. build the project from the classproject directory by typing `mvn install`

5. To run it, cd to the target directory

run the main class:

    java -cp 'playlist-1.0-SNAPSHOT.jar:lib/*' StartJetty

6. Visit the application at `http://localhost:8080/playlist`


Building and running on Windows
-----

1. Install Java 7 JDK.  This is required for running the application as well as building it

set your JAVA_HOME to the new JDK root directory.  You can do this either in the System Control panel for the whole system
or do it in a single terminal window. 

eg. for a cmd window

    set JAVA_HOME=c:\Program Files\Java\jdk1.7.0_40

Add Java into your path with the new JAVA_HOME:

    set PATH=%JAVA_HOME%\bin;%PATH%

2. set up Maven, by unpacking it into a directory, and add its bin directory to the PATH

    set PATH=%PATH%;c:\Users\Steve\apache-maven-3.1.0\bin

3. Set up Cassandra

5. Build the project

    mvn install

6. Run a standalone server

Ensure you are in the project root.

Run it as follows:

    cd to the target directory

    java -cp 'playlist-1.0-SNAPSHOT.jar;lib\*' StartJetty

7. Visit the application at `http://localhost:8080/playlist`



