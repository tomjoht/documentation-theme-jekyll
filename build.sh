#!/bin/sh

if [ "$#" -lt 3 ]; then
  exit 1
fi

DOC_REPO=$1
CI_BUILD_REPO=$2
CI_BUILD_REF_NAME=$3

# clone the actual documentation repository
rm -rf ./doc_repo
git clone $DOC_REPO ./doc_repo
cd ./doc_repo

# prepare scripts
chmod u+x ./scripts/*.sh

# attach the content repository to documentation repository
./scripts/doc-attach.sh $CI_BUILD_REPO current

# checkout provided version of content repository
cd ./pages/current
git checkout $CI_BUILD_REF_NAME
cd ../..

# regenerate sym links and top-level toc
./scripts/doc-regenerate.sh

# install required Gems
bundle install

# build HTML static site
bundle exec jekyll build -d ../_site

# generate PDF
./scripts/doc-pdf.sh "./pages/current" "../_pdf/output.pdf"