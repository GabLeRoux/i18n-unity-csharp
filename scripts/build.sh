#!/usr/bin/env sh

project_path=$(pwd)/src

error_code=0

echo "Building project for Mac OS."
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile \
  -projectPath "${project_path}" \
  -buildOSXUniversalPlayer "$(pwd)/build/osx/ci-build.app" \
  -quit
if [ $? = 0 ] ; then
  echo "Building Mac OS completed successfully."
  error_code=0
else
  echo "Building Mac OS failed. Exited with $?."
  error_code=1
fi

echo "Finishing with code ${error_code}"
exit ${error_code}
