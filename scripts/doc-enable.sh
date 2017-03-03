#!/bin/sh

if [ "$#" -lt 1 ]; then
  echo "Usage: $0 DOC_ID" >&2
  echo "" >&2
  echo " At least a documentation ID is required" >&2
  exit 1
fi

DOC_ID=$1

# retrieve location of this script
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

DOC_ROOT_PATH=$SCRIPTPATH/..
DOC_RELATIVE_PATH=pages/$DOC_ID

DOC_PATH=$DOC_ROOT_PATH/$DOC_RELATIVE_PATH

if [ -f $DOC_PATH/sidebar.yml ]; then
  echo "Documentation with ID '$DOC_ID' is already enabled. Skipping."
  exit 0
fi

# todo: check if the doc exists in .gitmodules

git submodule init pages/$DOC_ID
git submodule update pages/$DOC_ID

if [ $? -ne 0 ]; then
  echo "Something went wrong";
  exit 1
fi 

# success
echo "Successfully enabled documentation with ID '$DOC_ID' documentation"
