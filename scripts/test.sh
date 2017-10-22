#!/usr/bin/env sh

project_path=$(pwd)/src/
test_results=$(pwd)/reports/unit-test-results.xml

error_code=0

echo "Running unit tests."
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile \
  -projectPath "${project_path}" \
  -editorTestsResultFile "${test_results}" \
  -runEditorTests \
  -quit

if [ $? = 0 ] ; then
  echo "Unit tests all passed successfully."
  error_code=0
else
  echo "Unit tests failed. Exited with $?."
  error_code=1
fi

echo 'Test results:'
cat ${test_results}

echo "Finishing with code ${error_code}"
exit ${error_code}
