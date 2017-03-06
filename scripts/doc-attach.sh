#!/bin/sh

if [ "$#" -lt 2 ]; then
  echo "Usage: $0 DOC_GIT_REPOSITORY_URL DOC_ATTACH_POINT" >&2
  echo "" >&2
  if [ "$#" -lt 1 ]; then
    echo " At least a Git repository URL is required" >&2
  fi
  echo " At least a documentation attach point is required" >&2
  exit 1
fi

DOC_GIT_REPOSITORY_URL=$1
DOC_NAME=$2
DOC_NAME_CAP=$(echo "$DOC_NAME" | sed 's/.*/\u&/') # capitalize first letter

# retrieve location of this script
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

DOC_ROOT_PATH=$SCRIPTPATH/..
DOC_RELATIVE_PATH=pages/$DOC_NAME
DOC_PATH=$DOC_ROOT_PATH/$DOC_RELATIVE_PATH

# 1. clone existing repository and add it as submodule
git submodule -q add $DOC_GIT_REPOSITORY_URL $DOC_RELATIVE_PATH

# 2. sidebar
DOC_SIDEBAR=$DOC_PATH/sidebar.yml
DOC_SIDEBAR_IN_ROOT=$DOC_ROOT_PATH/_data/sidebars/$DOC_NAME\_sidebar.yml
mkdir -p $DOC_ROOT_PATH/_data/sidebars

#   make a link to sidebar
if [ -e $DOC_SIDEBAR_IN_ROOT ]; then
   rm -f $DOC_SIDEBAR_IN_ROOT
fi
ln $DOC_SIDEBAR $DOC_SIDEBAR_IN_ROOT

# 3. data
DOC_DATA=$DOC_PATH/data.yml
DOC_DATA_IN_ROOT=$DOC_ROOT_PATH/_data/docs/$DOC_NAME\_data.yml
mkdir -p $DOC_ROOT_PATH/_data/docs

#   make a link to sidebar
if [ -e $DOC_DATA_IN_ROOT ]; then
   rm -f $DOC_DATA_IN_ROOT
fi
ln $DOC_DATA $DOC_DATA_IN_ROOT

# success
echo "Successfully attached existing $DOC_NAME documentation"