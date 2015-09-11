module GraphQL
  class Query
    class Context
      # For Parallel::ExecutionStrategy, make a promise.
      # Otherwise, it's not really async.
      def async(&block)
        if execution_strategy.respond_to?(:async)
          execution_strategy.async(block)
        else
          block.call
        end
      end
    end
  end
end
