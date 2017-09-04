#!/bin/bash

set -e +x

pushd appsmovie
  echo "Packaging JAR_1"
  ./mvnw clean package -DskipTests
popd

jar_count=`find appsmovie/target -type f -name *.jar | wc -l`

if [ $jar_count -gt 1 ]; then
  echo "More than one jar found, don't know which one to deploy. Exiting"
  exit 1
fi

find appsmovie/target -type f -name *.jar -exec cp "{}" package-output/appsmovie.jar \;

echo "Done packaging"
exit 0
