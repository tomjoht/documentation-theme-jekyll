#!/bin/sh

if [ "$#" -lt 1 ]; then
  echo "Usage: $0 DOC_NAME" >&2
  echo " At least a documentation name is required" >&2
  exit 1
fi

DOC_NAME=$1

DOC_ROOT_PATH=`pwd`/..
DOC_RELATIVE_PATH=pages/$DOC_NAME

cd $DOC_ROOT_PATH
git submodule deinit $DOC_RELATIVE_PATH
git rm $DOC_RELATIVE_PATH
rm -rf .git/modules/$DOC_RELATIVE_PATH

cd $OLDPWD
