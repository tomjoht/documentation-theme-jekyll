echo 'Killing all Jekyll instances'
kill -9 $(ps aux | grep '[j]ekyll' | awk '{print $2}')
clear

# serve all di print deliverables

# Writers
echo "Serving Writers PDF"
jekyll serve --detach --config configs/config_writers.yml,configs/config_writers_pdf.yml

# Designers
echo "Serving Designers PDF"
jekyll serve --detach --config configs/config_designers.yml,configs/config_designers_pdf.yml

echo "All done."
echo "Now run . mydoc_multibuild_pdf.sh"
