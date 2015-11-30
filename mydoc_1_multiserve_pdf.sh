echo 'Killing all Jekyll instances'
kill -9 $(ps aux | grep '[j]ekyll' | awk '{print $2}')
clear


echo "Building PDF-friendly HTML site for Mydoc Writers ..."
jekyll serve --detach --config configs/mydoc/config_writers.yml,configs/mydoc/config_writers_pdf.yml
echo "done"

echo "Building PDF-friendly HTML site for Mydoc Designers ..."
jekyll serve --detach --config configs/mydoc/config_designers.yml,configs/mydoc/config_designers_pdf.yml
echo "done"

echo "All done serving up the PDF-friendly sites. Now let's generate the PDF files from these sites."
echo "Now run . mydoc_2_multibuild_pdf.sh"