# Undertake HQ Ruby Standards

A Ruby gem that provides general conventions, standards, and best practices for Ruby development projects.

**undertakehq-ruby-standards** establishes patterns and utilities that can be shared across Ruby teams and projects, serving as a foundational layer for applications and other gems. It's designed with the philosophy of "convention over configuration" to minimize setup while providing powerful, reusable functionality.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'undertakehq-ruby-standards'
```

Then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install undertakehq-ruby-standards
```

## Ruby Version

This gem requires **Ruby 3.4+** and has no framework dependencies (works with vanilla Ruby, Rails, or any other framework).

## Usage

### Getting Started

Once installed, you can require the gem in your project:

```ruby
require 'undertakehq/ruby_standards'
```

This will load the core functionality provided by the gem. Specific modules can also be required individually for more granular control.

## Features

This gem provides standardized conventions and utilities for:

- **Code Organization**: Established patterns for structuring Ruby code
- **Utilities**: Reusable helper functions and utilities
- **Extensions**: Safe extensions to Ruby standard library classes
- **Configuration**: Configurable standards that can be customized per project
- **RuboCop Integration**: Comprehensive linting rules with specialized extensions
- **Minitest Enhancements**: Enhanced test assertions and helpers
- **Custom Cops**: Project-specific RuboCop cops for code quality

### RuboCop Extensions

The gem includes specialized RuboCop extensions for:

- **rubocop-minitest**: Linting rules for Minitest test files that enforce best practices
- **rubocop-rake**: Linting rules for Rake task definitions to improve build scripts

These extensions help maintain consistent code quality across your Ruby projects.

## Development

### Setup

```bash
bundle install
```

### Running Tests

```bash
# Run all tests
bundle exec rake test

# Run a specific test file
bundle exec ruby -Ilib:test test/path/to/file_test.rb

# Run tests matching a pattern
bundle exec rake test TESTOPTS="--name=pattern"
```

### Linting and Code Quality

```bash
# Check code style (includes minitest and rake extensions)
bundle exec rubocop

# Auto-fix violations
bundle exec rubocop -A

# Check for vulnerable dependencies
bundle exec bundler-audit check
```

The RuboCop configuration includes specialized extensions that provide:

- **Minitest linting**: Enforces best practices like using `assert`/`refute` over `assert_equal true/false`
- **Rake task linting**: Ensures proper Rake task definitions and descriptions
- **Ruby style enforcement**: Comprehensive Ruby style guide adherence
- **Production code quality**: Custom cops that discourage production anti-patterns

### Custom Cops

#### Undertakehq/AvoidSleep

The `AvoidSleep` cop discourages the use of `sleep` calls in production code, as they can lead to blocking operations and poor performance.

**What it detects:**

- All variants of sleep calls: `sleep()`, `Kernel.sleep()`, `::Kernel.sleep()`
- Any sleep duration including zero, integer, and decimal values

**What it ignores:**

- Non-Kernel receivers: `my_object.sleep()`, `some_module.sleep()` - these are intentional method calls on custom objects
- Variable or method definitions named `sleep` - the cop only targets actual method calls

**Examples:**

```ruby
# bad - detected in all variants
sleep(5)
sleep 5
Kernel.sleep(5)
::Kernel.sleep(5)

# good - use alternatives
SomeJob.set(wait: 5.seconds).perform_later
retry_with_backoff { api_call }

# allowed - non-Kernel receivers are ignored
my_object.sleep(5)      # Custom sleep method
sleep_scheduler.sleep() # Domain-specific sleep
```

**Note:** The cop flags sleep calls regardless of file context. If you need to allow sleep in test files, you can configure excludes in your project's RuboCop configuration.

### Using in Your Projects

To use the RuboCop configuration in your own projects, add this to your `.rubocop.yml`:

```yaml
inherit_gem:
  undertakehq-ruby-standards: config/rubocop.yml
```

### Building the Gem

```bash
gem build undertakehq-ruby-standards.gemspec
```

## Architecture

### Directory Structure

```
lib/
├── undertakehq/
│   ├── ruby_standards.rb       # Main entry point
│   ├── ruby_standards/
│   │   ├── version.rb          # Version definition
│   │   ├── config.rb           # Configuration
│   │   └── ...                 # Feature modules
test/
├── test_helper.rb              # Test setup and helpers
└── ...                         # Test files
Gemfile                         # Development dependencies
Rakefile                        # Rake tasks including test runner
undertakehq-ruby-standards.gemspec  # Gem specification
```

### Core Modules

When fully implemented, this gem will include modules for various standard practices. Each module can be required and used independently.

## Configuration

Configuration can be customized in your initializer (if using with Rails) or directly in your application:

```ruby
Undertakehq::RubyStandards.configure do |config|
  # Configuration options will be available here
end
```

## Contributing

We welcome contributions from the community! Please read our [CONTRIBUTING.md](CONTRIBUTING.md) guide for details on our code of conduct and the process for submitting pull requests.

## Development Status

This project is actively under development. Contributions are welcome via pull requests.

## License

This gem is released under the MIT License. See [LICENSE](LICENSE) for details.

## Code of Conduct

This project and everyone participating in it is governed by the [Contributor Covenant Code of Conduct](https://www.contributor-covenant.org/version/2/1/code_of_conduct/). By participating, you are expected to uphold this code.

## Related Projects

- [undertakehq-rails-standards](https://github.com/undertakehq/rails-standards) - Rails-specific conventions and standards built on top of undertakehq-ruby-standards

## Support

For issues, questions, or suggestions, please open an issue on the [GitHub repository](https://github.com/undertakehq/ruby-standards).

---

Made with ❤️ by the Undertake HQ team
