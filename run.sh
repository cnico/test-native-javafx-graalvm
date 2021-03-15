#!/bin/sh

date +"%T.%3N"
java -jar target/test-native-javafx-1.0.0-SNAPSHOT.jar

echo "--- now native one ---"

date +"%T.%3N"
target/client/x86_64-linux/test-native-javafx

