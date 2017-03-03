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

DOC_ROOT_PATH=`pwd`/..
DOC_RELATIVE_PATH=pages/$DOC_NAME

TEMPLATE_DIR=`pwd`/templates

cd $DOC_ROOT_PATH

# 1. clone existing repository and add it as submodule
git submodule -q add $DOC_GIT_REPOSITORY_URL $DOC_RELATIVE_PATH

# 2. sidebar
DOC_SIDEBAR=$DOC_RELATIVE_PATH/sidebar.yml

cp $TEMPLATE_DIR/sidebar.yml $DOC_SIDEBAR
sed -i -e "s/product_prefix: .*/product_prefix: $DOC_PREFIX/" $DOC_SIDEBAR
sed -i -e "s/product_prefix_/$DOC_PREFIX\_/" $DOC_SIDEBAR
sed -i -e "s/product[^:_]/$DOC_NAME/" $DOC_SIDEBAR
sed -i -e "s/Product/$DOC_NAME_CAP/" $DOC_SIDEBAR

#   make a link to sidebar
if [ -e _data/sidebars/$DOC_NAME\_sidebar.yml ]; then
   rm -f _data/sidebars/$DOC_NAME\_sidebar.yml
fi
ln $DOC_RELATIVE_PATH/sidebar.yml _data/sidebars/$DOC_NAME\_sidebar.yml

# 3. index
DOC_INDEX_PAGE=$DOC_RELATIVE_PATH/$DOC_PREFIX\_index.md

cp $TEMPLATE_DIR/pages/index.md $DOC_INDEX_PAGE
sed -i -e "s/product_prefix/$DOC_PREFIX/" $DOC_INDEX_PAGE
sed -i -e "s/product/$DOC_NAME/" $DOC_INDEX_PAGE
sed -i -e "s/Product/$DOC_NAME_CAP/" $DOC_INDEX_PAGE

# 4. sample
mkdir $DOC_RELATIVE_PATH/pages
DOC_SAMPLE_PAGE=$DOC_RELATIVE_PATH/pages/$DOC_PREFIX\_sample1.md

cp $TEMPLATE_DIR/pages/sample1.md $DOC_SAMPLE_PAGE
sed -i -e "s/product_prefix/$DOC_PREFIX/" $DOC_SAMPLE_PAGE
sed -i -e "s/product/$DOC_NAME/" $DOC_SAMPLE_PAGE
sed -i -e "s/Product/$DOC_NAME_CAP/" $DOC_SAMPLE_PAGE

# success
echo "Successfully created $DOC_NAME documentation"
cd $OLDPWD
