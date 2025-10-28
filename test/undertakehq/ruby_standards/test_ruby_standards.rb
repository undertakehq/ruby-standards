# frozen_string_literal: true

require "test_helper"

module Undertakehq
  module RubyStandards
    class TestRubyStandards < Minitest::Test
      def test_that_it_has_a_version_number
        refute_nil ::Undertakehq::RubyStandards::VERSION
      end

      def test_version_is_correct_format
        assert_match(/\d+\.\d+\.\d+/, ::Undertakehq::RubyStandards::VERSION)
      end
    end
  end
end
