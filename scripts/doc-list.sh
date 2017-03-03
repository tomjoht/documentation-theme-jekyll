#!/bin/sh

# retrieve location of this script
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

DOC_ROOT_PATH=$SCRIPTPATH/..
DOC_GIT_MODULES_PATH=$DOC_ROOT_PATH/.gitmodules

# for each submodule
MODULES_LIST=$(git config --file $DOC_GIT_MODULES_PATH --get-regexp path | awk '{ print $2 }')

while IFS= read -r line
do
  DOC_RELATIVE_PATH="$line"
  DOC_ID=$(echo $line | sed -rn "s|pages/(.*)|\1|p")
  echo $DOC_ID
done <<< "$MODULES_LIST"

