#!/usr/bin/env sh

project_path=$1
project=$2

export_path=$(pwd)/current-package/${project}.unitypackage

error_code=0

echo "Creating package."
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile \
  -projectPath "$project_path" \
  -exportPackage "Assets/NAME_OF_LIBRARY" "$export_path" \
  -quit
if [ $? = 0 ] ; then
  echo "Created package successfully."
  error_code=0
else
  echo "Creating package failed. Exited with $?."
  error_code=1
fi

echo "Finishing with code $error_code"
exit $error_code
