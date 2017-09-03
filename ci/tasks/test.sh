#!/bin/bash

set -ex

pushd attendee-service-source
  echo "Fetching Dependencies"
  #./mvnw clean package

  echo "Running Tests"
  ./mvnw test
popd

exit 0
