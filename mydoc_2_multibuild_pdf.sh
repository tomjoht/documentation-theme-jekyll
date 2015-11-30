# Doc Writers
echo "Building the Mydoc Writers PDF ..."
prince --javascript --input-list=../doc_outputs/mydoc/writers-pdf/prince-file-list.txt -o mydoc/files/mydoc_writers_pdf.pdf;
echo "done"

# Doc Designers
echo "Building Mydoc Designers PDF ..."
prince --javascript --input-list=../doc_outputs/mydoc/designers-pdf/prince-file-list.txt -o mydoc/files/mydoc_designers_pdf.pdf;
echo "done"

echo "All done building the PDFs!"
echo "Now build the web outputs: . mydoc_3_multibuild_web.sh"