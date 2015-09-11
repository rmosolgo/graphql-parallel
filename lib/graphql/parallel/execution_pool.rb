module GraphQL
  module Parallel
    class ExecutionPool < Celluloid::Supervision::Container
      pool GraphQL::Parallel::ExecutionWorker, as: :execution_worker_pool
    end
  end
end
