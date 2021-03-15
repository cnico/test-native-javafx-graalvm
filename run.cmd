@echo off

rem Avoir lancé au préalable un mvn package client:build

echo %time% 
java -jar target\test-native-javafx-1.0.0-SNAPSHOT.jar


echo "--- now native one ---"

echo %time%
target\client\x86_64-windows\test-native-javafx.exe
