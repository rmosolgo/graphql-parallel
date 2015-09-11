
def create_slow_field
  GraphQL::Field.define do
    type(types.Int)
    resolve -> (obj, args, ctx) {
      ctx.async {
        sleep 0.3
        1
      }
    }
  end
end

SlowType = GraphQL::ObjectType.define do
  name "Slow"
  field :slow1, field: create_slow_field
  field :slow2, field: create_slow_field
  field :slow3, field: create_slow_field
  field :slows, -> { types[SlowType] } do
    resolve -> (o, a, ctx)  { ctx.async { [:slow, :slow, :slow] } }
  end
end

SlowQueryType = GraphQL::ObjectType.define do
  name "Query"
  field :slow, SlowType do
    resolve -> (o, a, c) { :slow }
  end

  field :asyncError, types.String do
    resolve -> (o, a, c) { raise("This error was raised on purpose")  }
  end
end

SlowSchema = GraphQL::Schema.new(query: SlowQueryType)
SlowSchema.query_execution_strategy = GraphQL::Parallel::ExecutionStrategy
