source "https://rubygems.org"

# The github-pages gem pins Jekyll and its plugins to the versions that
# GitHub Pages uses, so local builds match what GitHub publishes.
gem "github-pages", group: :jekyll_plugins

# Ruby 3.0+ no longer bundles these gems, but Jekyll 3.x still needs them.
gem "webrick"
gem "csv"
gem "base64"
gem "bigdecimal"
gem "logger"
gem "ostruct"
gem "faraday-retry"

# If you aren't publishing with GitHub Pages, you can comment out the
# github-pages gem above and use plain Jekyll instead:
# gem "jekyll", "~> 4.3"

# Windows and JRuby don't include zoneinfo files, so bundle the tzinfo-data gem.
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
end

# Performance-booster for watching directories on Windows.
gem "wdm", "~> 0.1", platforms: [:mingw, :x64_mingw, :mswin]
