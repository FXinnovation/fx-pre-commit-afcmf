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

EXPRESSION='^((((build|chore|ci|doc|docs|maintenance|feat|fix|perf|refactor|revert|style|test){1}(\([a-zA-Z0-9 -._]+\))?(!)?:))|([Mm]erge)) .*$'
if ! echo "$FIRST_LINE" | grep -E "$EXPRESSION" > /dev/null; then
	echo "AFCMF Error - The first line of your commit msg does not match \"$EXPRESSION\"."
	echo "Please check https://www.conventionalcommits.org"
	exit 1
fi

if [ -n "$SECOND_LINE" ]; then
	echo "AFCMF Error - The second line of your commit msg is not empty."
	echo "$SECOND_LINE"
	exit 1
fi
