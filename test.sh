#!/bin/bash
#
if [ -z "$1" ]; then
  printf "No lab name given."
  exit 1;
fi

PYTHON_VERSION=$(grep -oE -- '[3]+.{11|12|13}+.[0-9]+' <<<$(python -V))
if [[ -z "$PYTHON_VERSION" ]]; then
  printf "You seem to have the wrong version of python, you need python >= v3.11.0"
  return 1;
fi

PYTHON_COMMAND=$(grep -oE -- '3.{11|12|13}' <<<$PYTHON_VERSION)

python ./scripts/test.py $1
