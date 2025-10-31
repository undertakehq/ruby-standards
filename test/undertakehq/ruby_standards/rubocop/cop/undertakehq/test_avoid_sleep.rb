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
            def cop
              @cop ||= ::RuboCop::Cop::Undertakehq::AvoidSleep.new(::RuboCop::Config.new)
            end

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
              refute_nil cop
              assert_instance_of ::RuboCop::Cop::Undertakehq::AvoidSleep, cop
            end

            def test_cop_has_sleep_call_matcher
              assert_respond_to cop, :sleep_call?
            end

            def test_detects_bare_sleep_with_parentheses
              source = "sleep(5)"
              offenses = run_cop_on_source(source)

              assert_equal 1, offenses.length, "Should detect bare sleep with parentheses"
              assert_match(/Avoid using `sleep`/, offenses.first.message)
            end

            def test_detects_bare_sleep_without_parentheses
              source = "sleep 5"
              offenses = run_cop_on_source(source)

              assert_equal 1, offenses.length, "Should detect bare sleep without parentheses"
              assert_match(/Avoid using `sleep`/, offenses.first.message)
            end

            def test_detects_kernel_sleep_with_parentheses
              source = "Kernel.sleep(5)"
              offenses = run_cop_on_source(source)

              assert_equal 1, offenses.length, "Should detect Kernel.sleep with parentheses"
              assert_match(/Avoid using `sleep`/, offenses.first.message)
            end

            def test_detects_kernel_sleep_without_parentheses
              source = "Kernel.sleep 5"
              offenses = run_cop_on_source(source)

              assert_equal 1, offenses.length, "Should detect Kernel.sleep without parentheses"
              assert_match(/Avoid using `sleep`/, offenses.first.message)
            end

            def test_detects_namespaced_kernel_sleep
              source = "::Kernel.sleep(5)"
              offenses = run_cop_on_source(source)

              assert_equal 1, offenses.length, "Should detect ::Kernel.sleep"
              assert_match(/Avoid using `sleep`/, offenses.first.message)
            end

            def test_detects_sleep_with_zero_argument
              source = "sleep(0)"
              offenses = run_cop_on_source(source)

              assert_equal 1, offenses.length, "Should detect sleep with zero argument"
              assert_match(/Avoid using `sleep`/, offenses.first.message)
            end

            def test_detects_sleep_with_decimal_argument
              source = "sleep(0.5)"
              offenses = run_cop_on_source(source)

              assert_equal 1, offenses.length, "Should detect sleep with decimal argument"
              assert_match(/Avoid using `sleep`/, offenses.first.message)
            end

            def test_allows_sleep_method_call_on_other_objects
              source = "my_object.sleep(5)\nsleepier.sleep(10)"
              offenses = run_cop_on_source(source)

              assert_empty offenses, "Should not flag sleep calls on other objects"
            end

            def test_allows_sleep_variable_access
              source = "sleep = 5\nputs sleep\nmy_hash[:sleep] = value"
              offenses = run_cop_on_source(source)

              assert_empty offenses, "Should not flag sleep variable access"
            end

            def test_allows_sleep_method_definition
              source = "def sleep\n  'not the real sleep'\nend"
              offenses = run_cop_on_source(source)

              assert_empty offenses, "Should not flag sleep method definition"
            end

            def test_allows_background_job_alternatives
              source = "SomeJob.set(wait: 5.seconds).perform_later\nretry_with_backoff { api_call }"
              offenses = run_cop_on_source(source)

              assert_empty offenses, "Should not flag background job alternatives"
            end

            private

            def run_cop_on_source(source)
              @cop = ::RuboCop::Cop::Undertakehq::AvoidSleep.new(::RuboCop::Config.new)

              # Use RuboCop's commission to properly run the cop
              commissioner = ::RuboCop::Cop::Commissioner.new([@cop], [], raise_error: true)
              processed_source = ::RuboCop::ProcessedSource.new(source, ruby_version, "/tmp/test.rb")

              investigation_report = commissioner.investigate(processed_source)
              investigation_report.offenses
            end

            def ruby_version
              3.4
            end
          end
        end
      end
    end
  end
end
