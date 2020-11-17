#!/usr/bin/env bash
set -eo pipefail

COMMIT_FILE=$1
LINES_COUNT=$(cat ${COMMIT_FILE} | wc -l)
FIRST_LINE=$(head -n 1 ${COMMIT_FILE})
if (( $LINES_COUNT > 1 )); then
	SECOND_LINE=$(head -n 2 ${COMMIT_FILE} | tail -n 1 | sed '/^#/d')
else
	SECOND_LINE=""
fi

if ! echo "$FIRST_LINE" | grep -E "^(feat|refactor|chore|maintenance|fix|test|doc|revert): .*$" > /dev/null; then
	echo "AFCMF Error - The first line of your commit msg does not match \"^(feat|refactor|chore|maintenance|fix|test|doc|revert): .*$\"."
	exit 1
fi

if [ -n "$SECOND_LINE" ]; then
	echo "AFCMF Error - The second line of your commit msg is not empty."
	echo "$SECOND_LINE"
	exit 1
fi
