# GraphQL::Parallel

[![Build Status](https://travis-ci.org/rmosolgo/graphql-parallel.svg?branch=master)](https://travis-ci.org/rmosolgo/graphql-parallel)

Provides one layer of asynchronous field resolution to the [`graphql` gem](https://github.com/rmosolgo/graphql-ruby), backed Celluloid.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'graphql-parallel'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install graphql-parallel

## Usage

Require `GraphQL::Parallel`:

```ruby
require 'graphql/parallel'
```

Use `context.async` in your field resolve functions:

```ruby
resolve -> (obj, args, context) do
  # resolve other fields while this request
  # is in progress:
  context.async do
    response = Net::HTTP.get_response(obj.uri)
    response.body
  end
end
```

Use `GraphQL::Parallel::ExecutionStrategy` for your schema's read queries:

```ruby
# Define your schema:
MySchema = GraphQL::Schema.new(query: MyQueryType)

# Use parallel execution for read queries:
MySchema.query_execution_strategy = GraphQL::Parallel::ExecutionStrategy
```

_(`MySchema` will still use the default sequential execution strategy for mutations.)_

## License

MIT
