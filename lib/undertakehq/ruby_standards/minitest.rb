# frozen_string_literal: true

module Undertakehq
  module RubyStandards
    # Minitest integration module for Undertake HQ Ruby Standards
    #
    # This module provides utilities for loading Minitest configuration
    # and test helpers for projects using undertakehq-ruby-standards.
    #
    # @example Loading the Minitest configuration
    #   require "undertakehq/ruby_standards/minitest"
    #   Undertakehq::RubyStandards::Minitest.load!
    #
    # @example Using the base test class
    #   require "undertakehq/ruby_standards/minitest"
    #
    #   class MyTest < Undertakehq::RubyStandards::TestCase
    #     def test_example
    #       assert_true some_condition
    #     end
    #   end
    module Minitest
      # Loads the Minitest configuration and helpers
      #
      # This method requires the shared Minitest helper configuration
      # which includes the base TestCase class and common assertions.
      #
      # @return [void]
      def self.load!
        require File.expand_path("../../../config/minitest_helper", __dir__)
      end

      # Returns the path to the Minitest helper configuration file
      #
      # @return [String] the absolute path to config/minitest_helper.rb
      def self.config_path
        File.expand_path("../../../config/minitest_helper.rb", __dir__)
      end
    end
  end
end
