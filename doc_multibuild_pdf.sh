# Writers PDF
echo "Building the Writers PDF..."
prince --javascript --input-list=../doc_writers-pdf/prince-file-list.txt -o /Users/tjohnson/projects/documentation-theme-jekyll/doc_writers_pdf.pdf;

# Designers PDF
echo "Building the Designers PDF ..."
prince --javascript --input-list=../doc_designers-pdf/prince-file-list.txt -o /Users/tjohnson/projects/documentation-theme-jekyll/doc_designers_pdf.pdf;

echo "All done."
echo "Now run . doc_multibuild_web.sh"
