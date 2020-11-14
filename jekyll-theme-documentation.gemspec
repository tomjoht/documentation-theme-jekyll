# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "jekyll-theme-documentation"
  spec.version       = "0.1.0"
  spec.authors       = ["Tom Johnson"]
  spec.email         = ["tomjoht@gmail.com"]

  spec.summary       = "A Jekyll-based theme designed for documentation and help systems. See the link for detailed instructions on setting up and configuring everything."
  spec.homepage      = "https://idratherbewriting.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README|_config\.yml)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.1"
end
