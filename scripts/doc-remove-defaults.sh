#!/bin/sh

# retrieve location of this script
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

DOC_ROOT_PATH=$SCRIPTPATH/..

rm $DOC_ROOT_PATH/_data/sidebars/*.yml
rm $DOC_ROOT_PATH/_posts/*.md
rm -rf $DOC_ROOT_PATH/pages/mydoc
rm -rf $DOC_ROOT_PATH/pages/product1
rm -rf $DOC_ROOT_PATH/pages/product2
rm $DOC_ROOT_PATH/pdf-*.sh
rm $DOC_ROOT_PATH/pdf/*.pdf
rm $DOC_ROOT_PATH/pdfconfigs/config_*.yml
