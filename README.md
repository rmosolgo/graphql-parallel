# GraphQL::Parallel

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

```ruby
require 'graphql/parallel'

# Define all your types ...
# Define your schema:
MySchema = GraphQL::Schema.new(query: MyQueryType)

# Use parallel execution for read queries:
MySchema.query_execution_strategy = GraphQL::Parallel::ExecutionStrategy
```

## License

MIT
