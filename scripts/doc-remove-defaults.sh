#!/bin/sh

DOC_ROOT_PATH=`pwd`/..

cd $DOC_ROOT_PATH

rm _data/sidebars/*.yml
rm _posts/*.md
rm -rf pages/mydoc
rm -rf pages/product1
rm -rf pages/product2
rm pdf-*.sh
rm pdf/*.pdf
rm pdfconfigs/config_*.yml

cd $OLDPWD
