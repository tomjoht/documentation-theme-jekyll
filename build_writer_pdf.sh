# first build jekyll
jekyll serve --detach --config configs/config_writer_pdf.yml --destination /users/tjohnson/projects/documentation-theme-jekyll-builds/writer-pdf
# now call prince and build the pdf

prince --input-list=/users/tjohnson/projects/documentation-theme-jekyll-builds/writer-pdf/prince-file-list.txt -o /users/tjohnson/projects/documentation-theme-jekyll-builds/writer-pdf

# now find a way to kill the detached server
