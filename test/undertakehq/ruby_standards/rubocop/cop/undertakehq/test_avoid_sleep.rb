# frozen_string_literal: true

require "test_helper"
require "rubocop"
require "undertakehq/ruby_standards/rubocop/cop/undertakehq/avoid_sleep"

module Undertakehq
  module RubyStandards
    module RuboCop
      module Cop
        module Undertakehq
          class TestAvoidSleep < ::Minitest::Test
            def test_cop_is_defined
              refute_nil ::RuboCop::Cop::Undertakehq::AvoidSleep
            end

            def test_cop_message
              assert_equal(
                "Avoid using `sleep` in production code. Consider using background jobs or async alternatives.",
                ::RuboCop::Cop::Undertakehq::AvoidSleep::MSG,
              )
            end

            def test_cop_can_be_instantiated
              config = ::RuboCop::Config.new
              cop = ::RuboCop::Cop::Undertakehq::AvoidSleep.new(config)

              refute_nil cop
              assert_instance_of ::RuboCop::Cop::Undertakehq::AvoidSleep, cop
            end

            def test_cop_has_sleep_call_matcher
              config = ::RuboCop::Config.new
              cop = ::RuboCop::Cop::Undertakehq::AvoidSleep.new(config)

              assert_respond_to cop, :sleep_call?
            end
          end
        end
      end
    end
  end
end
