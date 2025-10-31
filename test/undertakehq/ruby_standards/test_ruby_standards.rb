# frozen_string_literal: true

require "test_helper"

module Undertakehq
  module RubyStandards
    class TestRubyStandards < ::Minitest::Test
      def setup
        ::Undertakehq::RubyStandards.reset_configuration!
      end

      def test_that_it_has_a_version_number
        refute_nil ::Undertakehq::RubyStandards::VERSION
      end

      def test_version_is_correct_format
        assert_match(/\d+\.\d+\.\d+/, ::Undertakehq::RubyStandards::VERSION)
      end

      def test_has_configuration
        refute_nil ::Undertakehq::RubyStandards.config
        assert_instance_of ::Undertakehq::RubyStandards::Config, ::Undertakehq::RubyStandards.config
      end

      def test_configuration_defaults
        config = ::Undertakehq::RubyStandards.config

        refute config.auto_load_minitest
        refute config.auto_load_rubocop
        refute config.strict_mode
      end

      def test_can_configure
        ::Undertakehq::RubyStandards.configure do |config|
          config.auto_load_minitest = true
        end

        assert ::Undertakehq::RubyStandards.config.auto_load_minitest
      end

      def test_can_reset_configuration
        ::Undertakehq::RubyStandards.configure do |config|
          config.strict_mode = true
        end

        ::Undertakehq::RubyStandards.reset_configuration!

        refute ::Undertakehq::RubyStandards.config.strict_mode
      end
    end
  end
end
