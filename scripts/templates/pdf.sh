# retrieve location of this script
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

echo 'Killing all Jekyll instances'
kill -9 $(ps aux | grep '[j]ekyll' | awk '{print $2}')
clear

echo "Building PDF-friendly HTML site...";
jekyll serve --detach --config $SCRIPTPATH/../../_config.yml,$SCRIPTPATH/pdf.yml;
echo "done";

echo "Building the PDF...";
mkdir -p $SCRIPTPATH/pdf
prince --javascript --input-list=$SCRIPTPATH/../../_site/pdfconfigs/prince-list.txt -o $SCRIPTPATH/pdf/output.pdf;
echo "done";
