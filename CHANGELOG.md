# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Initial gem scaffold
- Enforced Ruby 3.4+ requirement
- Add RuboCop 1.81
- Add Minitest 5.26
- RuboCop configuration for Ruby projects (targeting Ruby 3.4)
- Minitest helper configuration
- Base module structure
- Comprehensive RuboCop configuration
- Custom cop framework with AvoidSleep example
- Enhanced Minitest assertions and base test class
- Configuration system with auto-load support
- Added rubocop-minitest extension for improved Minitest linting
- Added rubocop-rake extension for Rake task linting
- Configured specialized Minitest cops with sensible defaults
- Configured Rake cops for better task definition standards

### Improved

- Enhanced `Undertakehq/AvoidSleep` cop to detect all sleep call variants:
  - Now catches `sleep()`, `Kernel.sleep()`, and `::Kernel.sleep()`
  - Comprehensive test suite covering all sleep variants and edge cases
