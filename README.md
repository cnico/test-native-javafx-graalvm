# test-native-javafx-graalvm
This is a simple and small test project for creating native binary on a javafx project.

The aim of this test is to measure on my laptop (an intel core i5-8250 with 8Go of RAM and SSD drives), the difference of startup time for a classic Java FX application and a native compiled one with graalvm.

For this test, I followed, this tutorial and I updated the versions of the various dependencies in order to be update of the latest releases :
https://gluonhq.com/native-desktop-application-using-substrate-graalvm/
Thanks to gluon's work, the compilation of a native image for a javafx application is as simple as adding a maven plugin to a pom :).

# Installation 
The pre-requisites are : 
* An installation of visual studio : I installed VS 2019 at version v16.9.1. You have to install the "Desktop Development C++" which will give you the c compiler and linker used by native-image of graalVM.
* graalvm community edition : I installed graalvm-ce-java11-21.0.0.2 one
* openJDK : I installed adoptopenJDK windows build : jdk-11.0.10.9-hotspot
* apache maven : 3.6.3 in my case

# Build
Clone this repository in whatever directory.

Open a Developper command of VS 2019 : it should be present in start menu.

Set the env vars (x64 compiler, JAVA_HOME, GRAALVM_HOME and PATH) by running script : `init_env_vars_graal.cmd`

Test everything is ok with `mvn --version`

Install native image with : `gu install native-image`

Launch a build : `mvn clean package client:build`

This commands creates a fat jar with springboot maven plugin and a native compiled image with gluon client maven plugin.

# Run
As graalVM JVM is known to be slower than openJDK one, I run the compiled fat jar with adoptopenJDK hotspot.

Open a classic windows terminal

Set the env vars : `init_env_vars.cmd`

Run it with : `run.cmd`

This script will simply do a `java -jar target\test-native-javafx-1.0.0-SNAPSHOT.jar` and a `target\client\x86_64-windows\test-native-javafx.exe`

This will show the time just before the java launch, the time just after the jvm launch (first instruction in the main) and the time after javafx launch. Those timing are displayed in the application window.

By substracting the timings, we can measure the jvm or native exe startup time and the javafx initialisation time : it is a very rough approximation in centiseconds.

# Results
I did a few runs and the results in startup time are globally the following (this is an average for 5 runs and all runs excepted the first one are very similar) : 

With a classic JVM start we have : **400ms** for JVM startup time and **500ms** for Javafx initialisation time

With the native image we have : **700ms** for exe startup and **100ms** for Javafx initialisation time

So the perceived user startup time is globaly the same : between 800ms and 1s. 

=> So Building a native image or a classic jar with the jvm gives us the same result for startup time from user point of view.

My analysis of these results is that native image execution is slower to startup because it will load a lots of javafx elements whereas with classic jvm, this will be lazy loaded. But the job has to be done.

Of course, this should perhaps be fine tuned with some advanced compilation options or slimming but I did not search for it considering only defaults values.

