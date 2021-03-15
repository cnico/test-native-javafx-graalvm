@echo off

SET GRAALVM_HOME=D:\platform_java11\graalvm-ce-java11-21.0.0.2

SET JAVA_HOME=%GRAALVM_HOME%
SET M2_HOME=D:\platform_java11\apache-maven-3.6.3

SET PATH=%JAVA_HOME%\bin;%M2_HOME%\bin;%PATH%;

D:\Utils\VisualStudio_Community\IDE\VC\Auxiliary\Build\vcvars64.bat
