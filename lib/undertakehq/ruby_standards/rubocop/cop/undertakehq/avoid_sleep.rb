# frozen_string_literal: true

require "rubocop"

module RuboCop
  module Cop
    module Undertakehq
      # Cop to discourage the use of `sleep` in production code.
      #
      # Using `sleep` can lead to blocking operations and poor performance
      # in production environments. Consider using asynchronous alternatives,
      # background jobs, or proper retry mechanisms instead.
      #
      # @example
      #   # bad
      #   sleep(5)
      #   sleep 5
      #   Kernel.sleep(5)
      #   ::Kernel.sleep(5)
      #
      #   # good
      #   # Use a background job scheduler
      #   SomeJob.set(wait: 5.seconds).perform_later
      #
      #   # Use retry mechanisms with exponential backoff
      #   retry_with_backoff { api_call }
      #
      class AvoidSleep < Base
        MSG = "Avoid using `sleep` in production code. Consider using background jobs or async alternatives."

        # @!method sleep_call?(node)
        def_node_matcher :sleep_call?, <<~PATTERN
          (send {nil? (const nil? :Kernel)} :sleep ...)
        PATTERN

        # @!method kernel_sleep_call?(node)
        def_node_matcher :kernel_sleep_call?, <<~PATTERN
          (send (const {nil? cbase (const nil? :Kernel)} :Kernel) :sleep ...)
        PATTERN

        def on_send(node)
          return unless sleep_call?(node) || kernel_sleep_call?(node)

          add_offense(node)
        end
      end
    end
  end
end
