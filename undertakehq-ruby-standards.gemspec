# frozen_string_literal: true

require_relative "lib/undertakehq/ruby_standards/version"

Gem::Specification.new do |spec|
  spec.name = "undertakehq-ruby-standards"
  spec.version = Undertakehq::RubyStandards::VERSION
  spec.authors = ["Davi Busanello"]
  spec.email = ["itsme@davibusanello.me"]

  spec.summary = "Ruby development standards and conventions for Undertake HQ projects"
  spec.description = "Provides general conventions, standards, and best practices for Ruby development. " \
                     "Includes RuboCop configurations, Minitest setup, and reusable utilities."
  spec.homepage = "https://github.com/undertakehq/ruby-standards"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.4.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/undertakehq/ruby-standards"
  spec.metadata["changelog_uri"] = "https://github.com/undertakehq/ruby-standards/blob/main/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(["git", "ls-files", "-z"], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?("bin/", "test/", "spec/", "features/", ".git", "appveyor", "Gemfile")
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Runtime dependencies
  spec.add_dependency "minitest", "~> 5.26"
  spec.add_dependency "rubocop", ">= 1.81", "< 2.0"
  spec.add_dependency "rubocop-minitest", ">= 0.38.2", "< 1.0"
  spec.add_dependency "rubocop-rake", ">= 0.7.1", "< 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
