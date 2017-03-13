#/bin/sh

if [ "$#" -lt 2 ]; then
  echo "Usage: $0 DOC_ATTACH_POINT PDF_OUTPUT_PATH" >&2
  exit 1
fi

DOC_ATTACH_POINT=$1
PDF_OUTPUT_PATH=$2

# retrieve location of this script
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

echo 'Killing all Jekyll instances'
kill -9 $(ps aux | grep '[j]ekyll' | awk '{print $2}')
clear

echo "Building PDF-friendly HTML site...";
bundle exec jekyll serve --detach --config $SCRIPTPATH/_config.yml,$SCRIPTPATH/$DOC_ATTACH_POINT/data/pdf.yml;
echo "done";

echo "Building the PDF...";
mkdir -p $SCRIPTPATH/pdf
prince --javascript --input-list=$SCRIPTPATH/_site/pdfconfigs/prince-list.txt -o $PDF_OUTPUT_PATH;
echo "done";
