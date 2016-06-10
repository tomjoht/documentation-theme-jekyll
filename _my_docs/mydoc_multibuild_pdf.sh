# Writers PDF
echo "Building the Writers PDF..."
prince --javascript --input-list=../mydoc_writers-pdf/prince-file-list.txt -o /Users/tjohnson/projects/documentation-theme-jekyll/mydoc_writers_pdf.pdf;

# Designers PDF
echo "Building the Designers PDF ..."
prince --javascript --input-list=../mydoc_designers-pdf/prince-file-list.txt -o /Users/tjohnson/projects/documentation-theme-jekyll/mydoc_designers_pdf.pdf;

echo "All done."
echo "Now run . mydoc_multibuild_web.sh"
