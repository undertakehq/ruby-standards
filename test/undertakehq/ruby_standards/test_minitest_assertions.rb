# frozen_string_literal: true

require "test_helper"
require File.expand_path("../../../config/minitest_helper", __dir__)

module Undertakehq
  module RubyStandards
    class TestMinitestAssertions < TestCase
      def setup
        @counter = Counter.new
      end

      def test_assert_true
        assert_true(true)
        assert_true(1)
        assert_true("hello")
      end

      def test_assert_true_with_falsey_values
        assert_raises(::Minitest::Assertion) { assert_true(false) }
        assert_raises(::Minitest::Assertion) { assert_true(nil) }
      end

      def test_assert_false
        assert_false(false)
        assert_false(nil)
      end

      def test_assert_false_with_truthy_values
        assert_raises(::Minitest::Assertion) { assert_false(true) }
        assert_raises(::Minitest::Assertion) { assert_false(1) }
        assert_raises(::Minitest::Assertion) { assert_false("hello") }
      end

      def test_assert_changes_with_block
        assert_changes(@counter, :count) { @counter.increment }
      end

      def test_assert_changes_with_by_parameter
        assert_changes(@counter, :count, by: 3) { @counter.increment(3) }
      end

      def test_assert_changes_with_from_parameter
        @counter.set(5)
        assert_changes(@counter, :count, from: 5) { @counter.increment }
      end

      def test_assert_changes_with_to_parameter
        @counter.set(5)
        assert_changes(@counter, :count, to: 8) { @counter.increment(3) }
      end

      def test_assert_changes_with_multiple_parameters
        @counter.set(5)
        assert_changes(@counter, :count, from: 5, to: 8, by: 3) { @counter.increment(3) }
      end

      def test_assert_changes_without_block_raises_error
        assert_raises(ArgumentError, "A block must be provided to assert_changes") do
          assert_changes(@counter, :count)
        end
      end

      def test_assert_no_changes_with_block
        assert_no_changes(@counter, :count) { @counter.read }
      end

      def test_assert_no_changes_without_block_raises_error
        assert_raises(ArgumentError, "A block must be provided to assert_no_changes") do
          assert_no_changes(@counter, :count)
        end
      end

      def test_assert_no_changes_fails_when_value_changes
        assert_raises(::Minitest::Assertion) do
          assert_no_changes(@counter, :count) { @counter.increment }
        end
      end

      # Helper class for testing assertions
      class Counter
        attr_reader :count

        def initialize
          @count = 0
        end

        def increment(amount = 1)
          @count += amount
        end

        def set(value)
          @count = value
        end

        def read
          @count
        end
      end
    end
  end
end
