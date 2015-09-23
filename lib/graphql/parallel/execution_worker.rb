module GraphQL
  module Parallel
    class ExecutionWorker
      include Celluloid
      def resolve(proc)
        proc.call
      rescue StandardError => err
        GraphQL::ExecutionError.new(err.message)
      end
    end
  end
end
