## Jekyll Documentation theme

Build the site to see the instructions for using it. Or just go here: [http://idratherbewriting.com/documentation-theme-jekyll/](http://idratherbewriting.com/documentation-theme-jekyll/)

## Running the site in Docker

You can also use Docker to directly build and run the site on your local machine. Just clone the repo and run the following from your working dir:

```
docker build --no-cache -t mydocs .
```

Once the build is complete, you can mount and run the whole site as follows:

```
docker run -v "$PWD:/src" -p 4000:4000 mydocs serve -H 0.0.0.0
```
This is perhaps the easiest way to see how your site would actually look.

