# Writers PDF
echo "Building the Writers PDF..."
prince --javascript --input-list=/Applications/XAMPP/xamppfiles/htdocs/documentation-theme-jekyll/writers-pdf/prince-file-list.txt -o /Users/tjohnson/projects/documentation-theme-jekyll/doc_writers_pdf.pdf;

# Designers PDF
echo "Building the Designers PDF ..."
prince --javascript --input-list=/Applications/XAMPP/xamppfiles/htdocs/documentation-theme-jekyll/designers-pdf/prince-file-list.txt -o /Users/tjohnson/projects/documentation-theme-jekyll/doc_designers_pdf.pdf;

# All done.
# Now run . doc_multiweb_pdf.sh
