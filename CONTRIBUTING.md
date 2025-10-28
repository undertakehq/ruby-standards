# Contributing to Undertake HQ Ruby Standards

Thank you for your interest in contributing to undertakehq-ruby-standards! We welcome contributions from the community. This document provides guidelines and instructions for getting started.

## Code of Conduct

This project and everyone participating in it is governed by the [Contributor Covenant Code of Conduct](https://www.contributor-covenant.org/version/2/1/code_of_conduct/). By participating, you are expected to uphold this code. Please report unacceptable behavior to the maintainers.

## How to Contribute

### Reporting Issues

Before submitting an issue, please:
1. Check the existing issues to avoid duplicates
2. Include a clear title and description
3. Provide code examples or reproduction steps if applicable
4. Specify your Ruby version and environment details

### Suggesting Enhancements

Enhancements should:
1. Clearly describe the enhancement and use case
2. Explain why this enhancement would be useful to users
3. Consider if the feature aligns with the gem's philosophy (general Ruby standards and conventions)
4. Discuss any potential backwards compatibility concerns

### Submitting Pull Requests

#### Prerequisites

1. Ensure you have **Ruby 3.4+** installed
2. Fork the repository
3. Clone your fork locally
4. Install dependencies:
   ```bash
   bundle install
   ```

#### Development Process

1. Create a feature branch from `main`:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. Make your changes, ensuring:
   - Code follows Ruby conventions and passes RuboCop checks
   - New features include comprehensive tests
   - Tests pass locally:
     ```bash
     bundle exec rake test
     bundle exec rubocop
     ```

3. Write clear, descriptive commit messages:
   - Use present tense ("Add feature" not "Added feature")
   - Include context about why the change was made
   - Reference issues if applicable (e.g., "Fixes #123")

4. Push to your fork and submit a pull request to the `main` branch

#### Pull Request Guidelines

- Provide a clear description of changes
- Include any new dependencies and justify their necessity
- Update README.md or CHANGELOG.md if appropriate
- Ensure all tests pass and code is properly formatted
- Keep pull requests focused and reasonably sized
- Be responsive to review feedback

## Coding Standards

### Style Guide

This project follows Ruby style conventions enforced by RuboCop. To check your code:

```bash
bundle exec rubocop
bundle exec rubocop -A  # Auto-fix violations
```

### Testing Requirements

- All new functionality must include tests
- Tests should be written with Minitest
- Aim for high test coverage
- Use descriptive test names that explain what is being tested

Example test structure:
```ruby
require 'test_helper'

class MyClassTest < Minitest::Test
  def test_method_name_returns_expected_result
    # arrange
    object = MyClass.new

    # act
    result = object.method_name

    # assert
    assert_equal expected_value, result
  end

  def test_method_name_when_condition_is_met
    # arrange, act, assert
  end
end
```

### Documentation

- Include inline comments for complex logic
- Document public APIs in README.md
- Add examples for new features
- Update CHANGELOG.md with significant changes

## Development Tips

### Running Tests Efficiently

```bash
# Run all tests
bundle exec rake test

# Run tests for a specific file
bundle exec ruby -Ilib:test test/path/to/file_test.rb

# Run tests matching a pattern
bundle exec rake test TESTOPTS="--name=pattern"

# Run with verbose output
bundle exec rake test VERBOSE=true
```

### Checking for Vulnerabilities

```bash
bundle exec bundler-audit check
```

### Building Locally

```bash
gem build undertakehq-ruby-standards.gemspec
```

## Versioning

This project follows [Semantic Versioning](https://semver.org/):
- MAJOR version for incompatible API changes
- MINOR version for backwards-compatible functionality additions
- PATCH version for backwards-compatible bug fixes

Version changes are managed by maintainers during release.

## Getting Help

- Check the README.md for usage examples
- Review existing issues and pull requests for similar questions
- Open a new issue if you have questions about contributing

## Review Process

1. A maintainer will review your pull request
2. Changes may be requested for alignment with project goals
3. Feedback will be constructive and respectful
4. Once approved, a maintainer will merge your changes

## License

By contributing to undertakehq-ruby-standards, you agree that your contributions will be licensed under the MIT License, consistent with the project license.

Thank you for contributing to undertakehq-ruby-standards!
