module GraphQL
  module Parallel
    class FutureFieldResolution
      def initialize(field_resolution:, future:)
        @field_resolution = field_resolution
        @future = future
      end

      def result
        resolved_value = @future.value
        result_value = @field_resolution.get_finished_value(resolved_value)
        result_value
      end
    end
  end
end
