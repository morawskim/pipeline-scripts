#!/usr/bin/env bash

#       AUTHOR: Marcin Morawski <marcin@morawskim.pl>
#      CREATED: 2019-09-21
# REQUIREMENTS: envsubst

# DESCRIPTION
# Script to substitute environment variables when ouput a file. Don't have support for default values etc.

set -euo pipefail
IFS=$'\n\t'

USAGE="Usage: $0 fileToSub envFile1 envFile2 ... envFileN"
if [ "$#" == "0" ]; then
    echo "$USAGE"
    exit 1
fi

FILE=$1
shift

set -a
while (( "$#" )); do
  . $1
  shift
done
set +a
cat $FILE | envsubst
