require_relative "lib/tailwind_config/version"

Gem::Specification.new do |spec|
  spec.name = "tailwind_config"
  spec.license = "MIT"
  spec.version = TailwindConfig::VERSION
  spec.authors = ["Andrew Mason"]
  spec.email = ["andrewmcodes@protonmail.com"]

  spec.summary = "Export your Tailwind CSS configuration into a file that Rails can use."
  spec.description = '
    With this gem, you can export your Tailwind CSS configuration file into
    a format that Rails can easily interact with. You may want to do this if you want access to your styles in Ruby,
    to create a single source of truth for your design system, or if your templates are all Ruby vs. ERB
  '
  spec.homepage = "https://github.com/andrewmcodes/tailwind_config"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata = {
    "bug_tracker_uri" => "#{spec.homepage}/issues",
    "changelog_uri" => "#{spec.homepage}/blob/main/CHANGELOG.md",
    "documentation_uri" => spec.homepage,
    "homepage_uri" => spec.homepage,
    "source_code_uri" => spec.homepage
  }

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
