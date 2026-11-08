# Documentation theme for Jekyll

A Jekyll theme for technical documentation and help systems. It's designed for technical writers who document software and other technical products, and it handles multiple products in one site, each with its own sidebar.

**Documentation and demo:** [idratherbewriting.com/documentation-theme-jekyll](https://idratherbewriting.com/documentation-theme-jekyll/)

## Features

- A separate sidebar for each product, with up to three levels of navigation
- Top navigation with dropdown menus for moving between products
- Relative links throughout, so the site works offline, on any server, and under any `baseurl`
- Pages can live at the root or in subfolders
- Client-side search
- Tags and tag archive pages
- Alerts, callouts, tooltips, nav tabs, and other formatting includes
- Automated links built from your sidebar files
- PDF output with [Prince XML](https://www.princexml.com/)
- Special layouts for FAQs, knowledge bases, glossaries, and series
- Optional comments through [giscus](https://giscus.app) (GitHub Discussions)
- Bootstrap 3 and all other CSS and JavaScript libraries stored locally, with no CDN dependencies

## Quick start

You need Ruby 3.0 or later. See the installation guides for [Mac](https://idratherbewriting.com/documentation-theme-jekyll/mydoc_install_jekyll_on_mac.html), [Windows](https://idratherbewriting.com/documentation-theme-jekyll/mydoc_install_jekyll_on_windows.html), or [Linux](https://idratherbewriting.com/documentation-theme-jekyll/mydoc_install_jekyll_on_linux.html) if you haven't set up Ruby before.

1. Get a copy of the theme. Click **Use this template** to create your own repository, or click **Code** > **Download ZIP**.
2. In the project folder, install the gems:

   ```
   bundle install
   ```

3. Build and preview the site:

   ```
   bundle exec jekyll serve
   ```

4. Open http://127.0.0.1:4000 in your browser.

The theme is a complete Jekyll project, so the folder you downloaded is your site. Replace the sample content in `pages/` and `_data/sidebars/` with your own. The [getting started guide](https://idratherbewriting.com/documentation-theme-jekyll/) explains how to configure sidebars, the top navigation, and page front matter.

### Run with Docker

If you'd rather not install Ruby, run the site with Docker:

```
docker compose up
```

Then open http://localhost:4000.

## Publishing

The Gemfile uses the [github-pages gem](https://github.com/github/pages-gem), so local builds match what GitHub Pages publishes. To publish somewhere else, you can switch to the latest Jekyll by following the comments in the Gemfile. A `.gitlab-ci.yml` file is included for GitLab Pages.

## What's new

Version 7.0 updates the theme for current Ruby and GitHub Pages, fixes links from pages in subfolders, stores all libraries locally, and replaces the discontinued Commento comments with giscus. See the [7.0 release notes](https://idratherbewriting.com/documentation-theme-jekyll/mydoc_release_notes_70.html).

## Contributing

Bug reports and pull requests are welcome. Please open an [issue](https://github.com/tomjoht/documentation-theme-jekyll/issues) to describe a bug or propose a change. For pull requests, check that `bundle exec jekyll build` runs without errors. A GitHub Actions workflow runs the same build on every pull request.

## License

Apache License 2.0. See [LICENSE](LICENSE). The navgoco sidebar plugin is licensed separately under the BSD license in [LICENSE-BSD-NAVGOCO.txt](LICENSE-BSD-NAVGOCO.txt).
