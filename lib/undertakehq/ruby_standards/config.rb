# frozen_string_literal: true

module Undertakehq
  module RubyStandards
    # Configuration system for Undertake HQ Ruby Standards
    #
    # This class manages configuration options for the gem.
    # Projects can customize behavior by setting configuration values.
    #
    # @example Configuring the gem
    #   Undertakehq::RubyStandards.configure do |config|
    #     config.auto_load_minitest = true
    #     config.auto_load_rubocop = true
    #   end
    #
    # @example Accessing configuration
    #   Undertakehq::RubyStandards.config.auto_load_minitest
    #   # => true
    class Config
      # @!attribute [rw] auto_load_minitest
      #   @return [Boolean] whether to automatically load Minitest helpers (default: false)
      attr_accessor :auto_load_minitest

      # @!attribute [rw] auto_load_rubocop
      #   @return [Boolean] whether to automatically load RuboCop cops (default: false)
      attr_accessor :auto_load_rubocop

      # @!attribute [rw] strict_mode
      #   @return [Boolean] whether to enable strict mode with additional checks (default: false)
      attr_accessor :strict_mode

      def initialize
        @auto_load_minitest = false
        @auto_load_rubocop = false
        @strict_mode = false
      end

      # Reset configuration to default values
      #
      # @return [void]
      def reset!
        @auto_load_minitest = false
        @auto_load_rubocop = false
        @strict_mode = false
      end
    end
  end
end
