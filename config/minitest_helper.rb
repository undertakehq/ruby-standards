# frozen_string_literal: true

# Minitest configuration for Undertake HQ Ruby projects
# Projects can require this helper for consistent test setup

require "minitest/autorun"

# Configure Minitest reporters if needed
# Minitest::Reporters.use! [Minitest::Reporters::ProgressReporter.new]

module Undertakehq
  module RubyStandards
    # Base test class for common test utilities
    class TestCase < Minitest::Test
      # Add common test helpers here
    end
  end
end
