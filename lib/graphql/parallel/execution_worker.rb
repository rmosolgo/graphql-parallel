module GraphQL
  module Parallel
    class ExecutionWorker
      include Celluloid
      def resolve(proc)
        proc.call
      end
    end
  end
end
