# frozen_string_literal: true

# Minitest configuration for Undertake HQ Ruby projects
# Projects can require this helper for consistent test setup

require "minitest/autorun"

# Configure Minitest reporters if needed
# Minitest::Reporters.use! [Minitest::Reporters::ProgressReporter.new]

module Undertakehq
  module RubyStandards
    # Base test class for common test utilities
    #
    # This class provides a foundation for tests in projects using
    # undertakehq-ruby-standards. It includes common utilities and
    # helpful assertions.
    #
    # @example Using the base test class
    #   class MyTest < Undertakehq::RubyStandards::TestCase
    #     def test_something
    #       assert_true some_condition
    #     end
    #   end
    class TestCase < ::Minitest::Test
      # Make tests more readable with explicit assertions

      # Assert that a value is truthy
      #
      # @param value [Object] the value to check
      # @param message [String] optional failure message
      # @return [void]
      def assert_true(value, message = nil)
        assert value, message || "Expected #{value.inspect} to be truthy"
      end

      # Assert that a value is falsey
      #
      # @param value [Object] the value to check
      # @param message [String] optional failure message
      # @return [void]
      def assert_false(value, message = nil)
        refute value, message || "Expected #{value.inspect} to be falsey"
      end

      # Assert that a block changes a value
      #
      # @param object [Object] the object to monitor
      # @param method [Symbol] the method to call on the object
      # @param by [Integer, nil] the expected change amount
      # @param from [Object, nil] the expected initial value
      # @param to [Object, nil] the expected final value
      # @yield the block that should cause the change
      # @return [void]
      # @raise [ArgumentError] if no block is provided
      def assert_changes(object, method, by: nil, from: nil, to: nil)
        raise ArgumentError, "A block must be provided to assert_changes" unless block_given?

        initial_value = object.public_send(method)

        assert_equal from, initial_value, "Expected initial value to be #{from}, got #{initial_value}" if from

        yield

        final_value = object.public_send(method)

        if by
          expected_value = initial_value + by
          assert_equal expected_value, final_value, "Expected change by #{by}"
        end

        assert_equal to, final_value, "Expected final value to be #{to}, got #{final_value}" if to
      end

      # Assert that a block does not change a value
      #
      # @param object [Object] the object to monitor
      # @param method [Symbol] the method to call on the object
      # @yield the block that should not cause a change
      # @return [void]
      # @raise [ArgumentError] if no block is provided
      def assert_no_changes(object, method)
        raise ArgumentError, "A block must be provided to assert_no_changes" unless block_given?

        initial_value = object.public_send(method)

        yield

        final_value = object.public_send(method)

        assert_equal initial_value, final_value,
                     "Expected no change, but value changed from #{initial_value} to #{final_value}"
      end
    end
  end
end
