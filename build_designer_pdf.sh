jekyll serve --config config_base.yml,config_designer.yml,config_designer_pdf.yml&
sleep 9

prince --input-list=../documentation-theme-jekyll-builds/designer-pdf/prince-file-list.txt -o ../documentation-theme-jekyll-builds/pdf-output/designer.pdf

kill -9 $(ps aux | grep '[j]ekyll' | awk '{print $2}')