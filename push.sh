# if you have the AWS Command Line Interface installed and are pushing your builds to AWS, this file shows how you can build and push to an AWS location from the command line.

jekyll build --config configs/build_writer.yml --destination /users/tjohnson/projects/documentation-theme-jekyll-builds/writer

aws s3 cp ~/users/tjohnson/projects/documentation-theme-jekyll-builds/writer s3://[aws path]documentation-theme-jekyll/writer --recursive

jekyll build --config configs/build_designer.yml --destination /users/tjohnson/projects/documentation-theme-jekyll-builds/designer

aws s3 cp ~/users/tjohnson/projects/documentation-theme-jekyll-builds/designer s3://[aws path]/documentation-theme-jekyll/designer --recursive