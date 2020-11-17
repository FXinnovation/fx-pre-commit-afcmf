#!/usr/bin/env bash
set -eo pipefail

echo "Starting tests..."
for DATA_FILE in $(ls tests/data/success)
do
	echo -n "+ Testing $DATA_FILE... "
	bash ./afcmf_commit_validation.sh "tests/data/success/$DATA_FILE" > /dev/null
	echo "OK"
done
for DATA_FILE in $(ls tests/data/failed)
do
	echo -n "+ Testing $DATA_FILE... "
	if bash ./afcmf_commit_validation.sh "tests/data/failed/$DATA_FILE" > /dev/null ; then
		exit 1
	else
          echo "OK"
	fi
done
echo "All tests have passed!"
