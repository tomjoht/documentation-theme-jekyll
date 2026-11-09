---
title: "Getting started with the Documentation Theme for Jekyll"
keywords: sample homepage
tags: [getting_started]
sidebar: mydoc_sidebar
permalink: index.html
summary: These brief instructions will help you get started quickly with the theme. The other topics in this help provide additional information and detail about working with other aspects of this theme and Jekyll.
---

{% include note.html content="If you're cloning this theme, you're probably writing documentation of some kind. I have a blog on technical writing here called <a alt='technical writing blog' href='http://idratherbewriting.com'>I'd Rather Be Writing</a>. If you'd like to stay updated with the latest trends, best practices, and other methods for writing documentation, consider <a href='https://idratherbewriting.com/newsletter/'>subscribing</a>. I also have a site on <a href='https://idratherbewriting.com/learnapidoc'>writing API documentation</a>." %}

## Build the Theme

Follow these instructions to build the theme.

### 1. Download the theme

First, get a copy of the theme from the [GitHub repo](https://github.com/tomjoht/documentation-theme-jekyll). You have three options:

* **Use this template.** On GitHub, click **Use this template** > **Create a new repository**. This gives you your own repository with a copy of the theme files and no shared history.
* **Download a ZIP.** Click **Code** > **Download ZIP**, and then unzip the file into the folder where you want your project to live.
* **Clone the repo.** Run `git clone https://github.com/tomjoht/documentation-theme-jekyll.git`.

Most likely you won't pull in updates once you start customizing the theme, so a template copy or a ZIP download usually makes more sense than a clone.

The theme is a complete Jekyll project, not a gem-based theme, so the downloaded folder *is* your site. The sample content lives in pages/mydoc, pages/product1, and pages/product2, and the matching sidebars live in \_data/sidebars. When you're ready, replace that sample content with your own. See [Move an existing site into the theme](#migrate) if you already have content in another Jekyll site.

### 2. Install Ruby and Jekyll

If you've never installed or run a Jekyll site locally on your computer, follow these instructions to install Ruby and Jekyll:

* [Install Jekyll on Mac][mydoc_install_jekyll_on_mac]
* [Install Jekyll on Windows][mydoc_install_jekyll_on_windows]
* [Install Jekyll on Linux][mydoc_install_jekyll_on_linux]

The theme works with Ruby 3.0 and later. If you'd rather not install Ruby at all, skip ahead to [Running the site in Docker](#docker).

### 3. Install Bundler

Recent versions of Ruby include [Bundler](https://bundler.io/). If you don't have it, install it:

```
gem install bundler
```

Bundler makes sure all the Ruby gems your project needs are installed at versions that work together. The gems are listed in the project's Gemfile, and the exact versions are recorded in Gemfile.lock.

### 4. Option 1: Build the Theme with the github-pages gem (default) {#option2}

The Gemfile in the theme uses the [github-pages gem](https://github.com/github/pages-gem), which installs the same versions of Jekyll and its plugins that [GitHub Pages](https://pages.github.com/) uses. Use this option if you publish on GitHub Pages, or if you aren't sure yet.

Change directories (`cd`) to where you downloaded the project, and install the gems:

```
bundle install
```

Then build and preview the site:

```
bundle exec jekyll serve
```

Open [http://127.0.0.1:4000](http://127.0.0.1:4000) in your browser. Jekyll rebuilds the site whenever you save a file.

{% include tip.html content="Always put `bundle exec` in front of `jekyll` commands. It makes Jekyll use the gem versions in Gemfile.lock instead of whatever versions happen to be installed on your computer." %}

### 4. Option 2: Build the Theme with the latest Jekyll {#option1}

If you publish somewhere other than GitHub Pages (such as Netlify, GitLab Pages, or your own server), you can use the latest version of Jekyll instead. Open the Gemfile, comment out the `github-pages` line, and uncomment the `jekyll` line:

```ruby
# gem "github-pages", group: :jekyll_plugins
gem "jekyll", "~> 4.3"
```

Then delete Gemfile.lock and run the same commands as before:

```
bundle install
bundle exec jekyll serve
```

## Running the site in Docker {#docker}

You can also use Docker to build and run the site without installing Ruby. Install [Docker Desktop](https://www.docker.com/products/docker-desktop/) (or Docker Engine with the compose plugin), and then run this command from the project folder:

```
docker compose up
```

The first run takes a few minutes while Docker builds the image. When it finishes, the site is running at [http://localhost:4000/](http://localhost:4000/), and it rebuilds when you save a file. Press Ctrl+C to stop it.

The build.sh and watch.sh scripts are shortcuts for the same thing. `./build.sh` builds the site into \_site, and `./watch.sh 4001` serves it on a different port.

If you change the Gemfile, rebuild the image with `docker compose build`.

## Move an existing site into the theme {#migrate}

Because the theme is a full Jekyll project rather than a gem-based theme, you move your content into the theme instead of applying the theme to your site. The general steps are as follows:

1.  Download the theme into a new folder, and build it once to make sure it works.
2.  Copy your Markdown files into a folder inside pages, such as pages/myproduct.
3.  In each file's front matter, set `sidebar`, `permalink`, and, optionally, `tags` and `summary`. See [Page frontmatter](#page-frontmatter).
4.  Create a sidebar file for your pages in \_data/sidebars, and add its name to the `sidebars` list in \_config.yml.
5.  Update \_config.yml with your site title, `topnav_title`, `github_editme_path`, and other settings.
6.  Delete the sample content you don't need from pages/mydoc, pages/product1, pages/product2, and \_data/sidebars.

Your old theme's layouts and includes won't carry over. If your pages use custom includes, copy them into \_includes and check that they still render as expected.

{% include note.html content="The theme doesn't work as a gem-based theme or with `remote_theme` yet. Jekyll only copies a remote theme's \_layouts, \_includes, \_sass, and assets folders, and this theme keeps its stylesheets and scripts in the css and js folders, so pages would build without any styling." %}

## Configure the sidebar

There are several products in this theme. Each product uses a different sidebar. This is the essence of what makes this theme unique -- different sidebars for different product documentation. The idea is that when users are reading documentation for a specific product, the sidebar navigation should be specific to that product. (You can read more of my thoughts on why multiple sidebars are important in this [blog post](http://idratherbewriting.com/2016/03/23/release-of-documentation-theme-for-jekyll-50/).)

The top navigation usually remains the same, because it allows users to navigate across products. But the sidebar navigation adapts to the product.

In each page's frontmatter, you must specify the sidebar you want that page to use. Here's an example of the page frontmatter showing the sidebar property:

<pre>
---
title: Alerts
tags: [formatting]
keywords: notes, tips, cautions, warnings, admonitions
last_updated: July 3, 2016
summary: "You can insert notes, tips, warnings, and important alerts in your content. These notes are stored as shortcodes made available through the linksrefs.hmtl include."
<span class="red">sidebar: mydoc_sidebar</span>
permalink: mydoc_alerts
---
</pre>

The `sidebar: mydoc_sidebar` refers to the \_data/sidebars/mydoc_sidebar.yml file.

The sidebar supports three levels: folders, the items inside folders, and subfolders inside items (expand the **Tag archives** option to see an example of the deepest level). Deeper nesting isn't supported. Given that each product has its own sidebar, this depth should be sufficient, and deeper nesting goes against usability recommendations anyway.

You can optionally turn off the sidebar on any page (e.g. landing pages). To turn off the sidebar for a page, set `hide_sidebar: true` in the page's frontmatter. Setting `sidebar: none` (or any name that doesn't match a file in \_data/sidebars) does the same thing. Either way, the content spans the full width of the page, and the **Nav** toggle disappears from the top navigation.

If you don't declare a sidebar, the `home_sidebar` file gets used as the default because this is the default specified in the config file:

```yaml
-
  scope:
    path: ""
    type: "pages"
  values:
    layout: "page"
    comments: true
    search: true
    sidebar: home_sidebar
    topnav: topnav
```

If you want to set different sidebar defaults based on different folders for your pages, specify your defaults like this:

```
-
  scope:
    path: "pages/mydoc"
    type: "pages"
  values:
    layout: "page"
    comments: true
    search: true
    sidebar: mydoc_sidebar
    topnav: topnav
```

This would load the `mydoc_sidebar` for each file in **pages/mydoc**. You could set different defaults for different path scopes.

For more detail on the sidebar, see [Sidebar navigation][mydoc_sidebar_navigation].

## Top navigation

The top navigation works just like the sidebar. You can specify which topnav data file should load by adding a `topnav` property in your page, like this:

```yaml
topnav: topnav
```

Here the topnav refers to the `_data/topnav.yml` file.

Because most topnav options will be the same, the `_config.yml` file specifies the topnav file as a default:

```yaml
-
  scope:
    path: ""
    type: "pages"
  values:
    layout: "page"
    comments: true
    search: true
    sidebar: home_sidebar
    topnav: topnav
```

## Sidebar syntax

The sidebar data file uses a specific YAML syntax that you must follow. Follow the sample pattern shown in the theme, specically looking at `mydoc_sidebar.yml` as an example: Here's a code sample showing all levels:

```yaml
entries:
- title: sidebar
  product: Jekyll Doc Theme
  version: 8.0
  folders:
  - title: Overview
    output: web, pdf
    folderitems:

    - title: Get started
      url: /index.html
      output: web, pdf
      type: homepage

    - title: Introduction
      url: /mydoc_introduction.html
      output: web, pdf

  - title: Release Notes
    output: web, pdf
    folderitems:

    - title: 6.0 Release notes
      url: /mydoc_release_notes_60.html
      output: web, pdf

    - title: 5.0 Release notes
      url: /mydoc_release_notes_50.html
      output: web, pdf

  - title: Tag archives
    output: web
    folderitems:

    - title: Tag archives overview
      url: /mydoc_tag_archives_overview.html
      output: web

      subfolders:
      - title: Tag archive pages
        output: web
        subfolderitems:

        - title: Formatting pages
          url: /tag_formatting.html
          output: web

        - title: Navigation pages
          url: /tag_navigation.html
          output: web

        - title: Content types pages
          url: /tag_content_types.html
          output: web
```

Each `folder` or `subfolder` must contain a `title` and `output` property. Each `folderitem` or `subfolderitem` must contain a `title`, `url`, and `output` property.

If you want a top-level item that links straight to a page instead of opening a folder, give the folder a `url` and leave out `folderitems`:

```yaml
  folders:
  - title: Overview
    url: /overview.html
    output: web
```

URLs must start with a slash. They can point to pages in subfolders, such as `/product1/install/overview.html`.

The `version` value appears next to the product name at the top of the sidebar. If you'd rather keep the version in one place, leave `version` out of the sidebar file and set `project_version` in \_config.yml instead. (Sidebar files are data files, so Liquid such as `{% raw %}{{site.version}}{% endraw %}` inside them isn't processed.)

If you want **Collapse All** and **Expand All** links below the sidebar, set `sidebar_expand_controls: true` in \_config.yml.

The two outputs available are `web` and `pdf`. (Even if you aren't publishing PDF, you still need to specify `output: web`).

The YAML syntax depends on exact spacing, so make sure you follow the pattern shown in the sample sidebars. See my [YAML tutorial][mydoc_yaml_tutorial] for more details about how YAML works.

{% include note.html content="If you have just one character of spacing off, Jekyll won't build due to the YAML syntax error. You'll see an error message in your console that says \"Error ... did not find expected key while parsing a block mapping at line 22 column 5. Error: Run jekyll build --trace for more information.\" If you encounter this, it usually refers to incorrect indentation or spacing in the YAML file. See the example mydoc_sidebar.yml file to see where your formatting went wrong." %}

Each level must have at least one topic before the next level starts. You can't have a second level that contains multiple third levels without having at least one standalone topic in the second level. If you need a hierarchy that has a folder that contains other folders and no loose topics, use a blank `-` item like this:

```yaml
entries:
- title: sidebar
  product: Jekyll Doc Theme
  version: 8.0
  folders:
  - title: Overview
    output: web, pdf
    folderitems:

    -

  - title: Release Notes
    output: web, pdf
    folderitems:

    - title: 6.0 Release notes
      url: /mydoc_release_notes_60.html
      output: web, pdf

    - title: 5.0 Release notes
      url: /mydoc_release_notes_50.html
      output: web, pdf

  - title: Installation
    output: web, pdf
    folderitems:

    - title: About Ruby, Gems, Bundler, etc.
      url: /mydoc_about_ruby_gems_etc.html
      output: web, pdf

    - title: Install Jekyll on Mac
      url: /mydoc_install_jekyll_on_mac.html
      output: web, pdf

    - title: Install Jekyll on Windows
      url: /mydoc_install_jekyll_on_windows.html
      output: web, pdf
```

To accommodate the title page and table of contents in PDF outputs, each product sidebar must list these pages before any other:

```yaml
- title:
  output: pdf
  type: frontmatter
  folderitems:
  - title:
    url: /titlepage
    output: pdf
    type: frontmatter
  - title:
    url: /tocpage
    output: pdf
    type: frontmatter
```

Leave the output as `output: pdf` for these frontmatter pages so that they don't appear in the web output.

For more detail on the sidebar, see [Sidebar navigation][mydoc_sidebar_navigation] and [YAML tutorial][mydoc_yaml_tutorial].

## Comments

Comments are off by default. The theme previously used Commento.io, but that service has shut down, so the theme now supports [giscus](https://giscus.app) instead. Giscus stores comments in GitHub Discussions, so it's free and doesn't add ads or tracking. To turn it on, follow these steps:

1.  Enable Discussions in your GitHub repository's settings.
2.  Install the [giscus app](https://github.com/apps/giscus) on the repository.
3.  Go to [giscus.app](https://giscus.app), enter your repository, and choose a discussion category. The page shows the `data-repo-id` and `data-category-id` values you need.
4.  Uncomment the `giscus` block in \_config.yml and fill in the values.

To hide comments on a single page, add `comments: false` to the page's frontmatter. The logic is in \_includes/comments.html.

## Relative links and offline viewing

This theme uses relative links throughout so that you can view the site offline and not worry about which server or directory you're hosting it. It's common with tech docs to push content to an internal server for review prior to pushing the content to an external server for publication. Because of the need for seamless transferrence from one host to another, the site has to use relative links. The CSS and JavaScript libraries (Bootstrap, jQuery, Font Awesome, and AnchorJS) are stored in the theme too, so pages don't depend on a CDN.

To view pages locally on your machine (without the Jekyll preview server), they need to have the `.html` extension. The `permalink` property in the page's frontmatter (without surrounding slashes) is what pushes the files into the root directory when the site builds.

Pages can also live in subfolders, such as `permalink: /product1/install/overview.html`. The theme works out how deep each page is and adds the right number of `../` segments in front of its stylesheets, scripts, and navigation links. For details, see [Links from pages in subfolders](mydoc_hyperlinks.html#links-from-pages-in-subfolders).

## Page frontmatter

When you write pages, include these same frontmatter properties with each page:

```yaml
---
title: "Some title"
tags: [sample1, sample2]
keywords: keyword1, keyword2, keyword3
last_updated: Month day, year
summary: "optional summary here"
sidebar: sidebarname
permalink: filename.html
---
```

(You will customize the values for each of these properties, of course.)

For titles, surrounding the title in quotes is optional, but if you have a colon in the title, you must surround the title with quotation marks. If you have a quotation mark inside the title, escape it first with a backlash `\`.

Values for `keywords` get populated into the metadata of the page for SEO.

Values for `tags` must be defined in your \_data/tags.yml list. You also need a corresponding tag file inside the tags folder pages/tags/ that follows the same pattern as the other tag files shown in the tags folder. (Jekyll won't auto-create these tag files.)

If you don't want the mini-TOC to show on a page (such as for the homepage or landing pages), add `toc: false` in the frontmatter.

The `permalink` value should usually be the same as your filename and include the ".html" file extension. If you want the URL to include a folder, include the folder in the permalink, such as `permalink: /product1/overview.html`.

For more detail, see [Pages][mydoc_pages].

## Where to store your documentation topics

You can store your files for each product inside subfolders following the pattern shown in the theme. For example, product1, product2, etc, can be stored in their own subfolders inside the pages directory. Inside pages, you can store your topics inside sub-subfolders or sub-sub-folders to your heart's content. When Jekyll builds your site, it uses each page's permalink for the URL, so a page with `permalink: mydoc_alerts.html` ends up in the root directory no matter which folder it's stored in.

Note that product1, product2, and mydoc are all just sample content to demonstrate how to add multiple products into the theme. You can freely delete that content.

For more information, see [Pages][mydoc_pages] and [Posts][mydoc_posts].

## Configure the top navigation

The top navigation bar's menu items are set through the \_data/topnav.yml file. Use the top navigation bar to provide links for navigating from one product to another, or to navigate to external resources.

For external URLs, use `external_url` in the item property, as shown in the example topnav.yml file. For internal links, use `url` the same was you do in the sidebar data files.

Note that the topnav has two sections: `topnav` and `topnav_dropdowns`. The topnav section contains single links, while the `topnav_dropdowns` section contains dropdown menus. The two sections are independent of each other.

## Generating PDF

If you want to generate PDF, you'll need a license for [Prince XML](http://www.princexml.com/). You will also need to [install Prince](http://www.princexml.com/doc/installing/).  You can generate PDFs by product (but not for every product on the site combined together into one massive PDF). Prince will work even without a license, but it will imprint a small Prince image on the first page, and you're supposed to buy the license to use it.

If you're on Windows, install [Git Bash client](https://gitforwindows.org/) rather than using the default Windows command prompt.

Open up the css/printstyles.css file and customize the email address (`youremail@domain.com`) that is listed there. This email address appears in the bottom left footer of the PDF output. You'll also need to create a PDF configuration file following the examples shown in the pdfconfigs folder, and also customize some build scripts following the same pattern shown in the root: pdf-product1.sh

See the section on [Generating PDFs][mydoc_generating_pdfs] for more details about setting the theme up for this output.

## Blogs / News

For blog posts, create your markdown files in the \_posts folder following the sample formats. Post file names always begin with the date (YYYY-MM-DD-title).

The pages/news/news.html file displays the posts, and the pages/news/news_archive.html file shows a yearly history of posts. In documentation, you might use the news to highlight product features outside of your documentation, or to provide release notes and other updates.

See [Posts][mydoc_posts] for more information.

## Markdown

This theme uses [kramdown markdown](http://kramdown.gettalong.org/). kramdown is similar to Github-flavored Markdown, except that when you have text that intercepts list items, the spacing of the intercepting text must align with the spacing of the first character after the space of a numbered list item. Basically, with your list item numbering, use two spaces after the dot in the number, like this:

```
1.  First item
2.  Second item
3.  Third item
```

When you want to insert paragraphs, notes, code snippets, or other matter in between the list items, use four spaces to indent. The four spaces will line up with the first letter of the list item (the <b>F</b>irst or <b>S</b>econd or <b>T</b>hird).

```
1.  First item

    ```
    alert("hello");
    ```

2.  Second item

    Some pig!

3.  Third item
```

See the topics under "Formatting" in the sidebar for more information.

## Automated links

If you want to use an automated system for managing links, see [Automated Links](mydoc_hyperlinks.html#automatedlinks). This approach automatically creates a list of Markdown references to simplify linking.

## Other instructions

The content here is just a getting started guide only. For other details in working with the theme, see the various sections in the sidebar.

{% include links.html %}
