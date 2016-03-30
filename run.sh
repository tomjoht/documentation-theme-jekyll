echo "updating urls.yml"
cd _site;
mv urls.txt ../_data/urls.yml;
cd ../;
echo "serving jekyll"
jekyll serve