# frozen_string_literal: true

require_relative "ruby_standards/version"
require_relative "ruby_standards/config"
require_relative "ruby_standards/rubocop"
require_relative "ruby_standards/minitest"

module Undertakehq
  # Undertake HQ Ruby Standards gem
  #
  # This gem provides general conventions, standards, and best practices
  # for Ruby development projects.
  module RubyStandards
    class Error < StandardError; end

    class << self
      # Returns the current configuration
      #
      # @return [Config] the configuration object
      def config
        @config ||= Config.new
      end

      # Configures the gem with a block
      #
      # @example
      #   Undertakehq::RubyStandards.configure do |config|
      #     config.auto_load_minitest = true
      #   end
      #
      # @yield [config] the configuration object
      # @yieldparam config [Config] the configuration object to modify
      # @return [void]
      def configure
        yield(config)
        apply_configuration!
      end

      # Resets the configuration to defaults
      #
      # @return [void]
      def reset_configuration!
        @config = Config.new
      end

      # Loads all features based on current configuration
      #
      # @return [void]
      def load!
        RuboCop.load_custom_cops! if config.auto_load_rubocop
        Minitest.load! if config.auto_load_minitest
      end

      private

      # Applies configuration settings
      #
      # @return [void]
      def apply_configuration!
        load!
      end
    end
  end
end
