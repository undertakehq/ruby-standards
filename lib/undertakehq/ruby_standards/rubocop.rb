# frozen_string_literal: true

module Undertakehq
  module RubyStandards
    # RuboCop integration module for Undertake HQ Ruby Standards
    #
    # This module provides utilities for loading RuboCop configuration
    # and custom cops for projects using undertakehq-ruby-standards.
    #
    # @example Inheriting the configuration in your project's .rubocop.yml
    #   inherit_gem:
    #     undertakehq-ruby-standards: config/rubocop.yml
    #
    # @example Loading custom cops
    #   require "undertakehq/ruby_standards/rubocop"
    module RuboCop
      # Returns the path to the base RuboCop configuration file
      #
      # @return [String] the absolute path to config/rubocop.yml
      def self.config_path
        File.expand_path("../../../config/rubocop.yml", __dir__)
      end

      # Loads all custom RuboCop cops defined in this gem
      #
      # @return [void]
      def self.load_custom_cops!
        require_relative "rubocop/cop/undertakehq/avoid_sleep"
      end
    end
  end
end
