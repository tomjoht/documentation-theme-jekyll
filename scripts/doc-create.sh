#!/bin/sh

if [ "$#" -lt 3 ]; then
  echo "Usage: $0 DOC_GIT_REPOSITORY_URL DOC_NAME DOC_PREFIX" >&2
  echo "" >&2
  if [ "$#" -lt 1 ]; then
    echo " At least a Git repository URL is required" >&2
  fi
  if [ "$#" -lt 2 ]; then
    echo " At least a documentation name is required" >&2
  fi
  echo " At least a documentation prefix is required" >&2
  exit 1
fi

DOC_GIT_REPOSITORY_URL=$1
DOC_NAME=$2
DOC_NAME_CAP=$(echo "$DOC_NAME" | sed 's/.*/\u&/') # capitalize first letter
DOC_PREFIX=$3

# retrieve location of this script
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

DOC_ROOT_PATH=$SCRIPTPATH/..
DOC_RELATIVE_PATH=pages/$DOC_NAME
DOC_PATH=$DOC_ROOT_PATH/$DOC_RELATIVE_PATH
TEMPLATE_DIR=$SCRIPTPATH/templates

# 1. clone existing repository and add it as submodule
git submodule -q add $DOC_GIT_REPOSITORY_URL $DOC_RELATIVE_PATH

# 2. sidebar
DOC_SIDEBAR=$DOC_PATH/sidebar.yml
DOC_SIDEBAR_IN_ROOT=$DOC_ROOT_PATH/_data/sidebars/$DOC_NAME\_sidebar.yml
mkdir $DOC_ROOT_PATH/_data/sidebars

cp $TEMPLATE_DIR/sidebar.yml $DOC_SIDEBAR
sed -i -e "s/product_prefix: .*/product_prefix: $DOC_PREFIX/" $DOC_SIDEBAR
sed -i -e "s/product_prefix_/$DOC_PREFIX\_/" $DOC_SIDEBAR
sed -i -e "s/product[^:_]/$DOC_NAME/" $DOC_SIDEBAR
sed -i -e "s/Product/$DOC_NAME_CAP/" $DOC_SIDEBAR

#   make a link to sidebar
if [ -e $DOC_SIDEBAR_IN_ROOT ]; then
   rm -f $DOC_SIDEBAR_IN_ROOT
fi
ln $DOC_SIDEBAR $DOC_SIDEBAR_IN_ROOT

# 3. data
DOC_DATA=$DOC_PATH/data.yml
DOC_DATA_IN_ROOT=$DOC_ROOT_PATH/_data/docs/$DOC_NAME\_data.yml
mkdir $DOC_ROOT_PATH/_data/docs

cp $TEMPLATE_DIR/data.yml $DOC_DATA
sed -i -e "s/=product_prefix=/$DOC_PREFIX/" $DOC_DATA
sed -i -e "s/=product=/$DOC_NAME/" $DOC_DATA
sed -i -e "s/=Product=/$DOC_NAME_CAP/" $DOC_DATA

#   make a link to sidebar
if [ -e $DOC_DATA_IN_ROOT ]; then
   rm -f $DOC_DATA_IN_ROOT
fi
ln $DOC_DATA $DOC_DATA_IN_ROOT

# 4. index
DOC_INDEX_PAGE=$DOC_PATH/$DOC_PREFIX\_index.md

cp $TEMPLATE_DIR/pages/index.md $DOC_INDEX_PAGE
sed -i -e "s/=product_prefix=/$DOC_PREFIX/" $DOC_INDEX_PAGE
sed -i -e "s/=product=/$DOC_NAME/" $DOC_INDEX_PAGE
sed -i -e "s/=Product=/$DOC_NAME_CAP/" $DOC_INDEX_PAGE

# 5. sample
mkdir $DOC_PATH/pages
DOC_SAMPLE_PAGE=$DOC_PATH/pages/$DOC_PREFIX\_sample1.md

cp $TEMPLATE_DIR/pages/sample1.md $DOC_SAMPLE_PAGE
sed -i -e "s/=product_prefix=/$DOC_PREFIX/" $DOC_SAMPLE_PAGE
sed -i -e "s/=product=/$DOC_NAME/" $DOC_SAMPLE_PAGE
sed -i -e "s/=Product=/$DOC_NAME_CAP/" $DOC_SAMPLE_PAGE

# success
echo "Successfully created $DOC_NAME documentation"
