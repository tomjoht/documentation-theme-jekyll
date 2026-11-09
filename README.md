# Documentation theme for Jekyll

A Jekyll theme for technical documentation and help systems. It's designed for technical writers who document software and other technical products, and it handles multiple products in one site, each with its own sidebar.

**Documentation and demo:** [idratherbewriting.com/documentation-theme-jekyll](https://idratherbewriting.com/documentation-theme-jekyll/)

## Features

- A separate sidebar for each product, with up to three levels of navigation, that slides out on small screens
- Breadcrumbs generated from the sidebar
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
- Colors and sizes set with CSS variables, so you can restyle the theme in one file
- Bootstrap 5, Font Awesome 7, and all other CSS and JavaScript libraries stored locally, with no CDN dependencies

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

Version 8.0 redesigns the theme on Bootstrap 5 and Font Awesome 7, with a layout based on [idratherbewriting.com](https://idratherbewriting.com): a gray sidebar that stays in view and slides out on small screens, breadcrumbs, and colors you can change with CSS variables. See the [8.0 release notes](https://idratherbewriting.com/documentation-theme-jekyll/mydoc_release_notes_80.html), which include steps for upgrading from version 7.

## Contributing

Bug reports and pull requests are welcome. Please open an [issue](https://github.com/tomjoht/documentation-theme-jekyll/issues) to describe a bug or propose a change. For pull requests, check that `bundle exec jekyll build` runs without errors. A GitHub Actions workflow runs the same build on every pull request.

## License

Apache License 2.0. See [LICENSE](LICENSE).

The theme includes these third-party libraries, each under its own license: [Bootstrap](https://getbootstrap.com/) (MIT), [jQuery](https://jquery.com/) (MIT), [Font Awesome Free](https://fontawesome.com/license/free) (icons under CC BY 4.0, fonts under SIL OFL 1.1, code under MIT), [AnchorJS](https://www.bryanbraun.com/anchorjs/) (MIT), [Simple-Jekyll-Search](https://github.com/christian-fei/Simple-Jekyll-Search) (MIT), and the navgoco sidebar plugin (BSD, see [LICENSE-BSD-NAVGOCO.txt](LICENSE-BSD-NAVGOCO.txt)).
