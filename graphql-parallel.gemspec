# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'graphql/parallel/version'

Gem::Specification.new do |spec|
  spec.name          = "graphql-parallel"
  spec.version       = Graphql::Parallel::VERSION
  spec.authors       = ["Robert Mosolgo"]
  spec.email         = ["rdmosolgo@gmail.com"]

  spec.summary       = %q{A simple parallel execution strategy for GraphQL.}
  spec.description   = %q{Extend the GraphQL gem by allowing for one level of asynchronous field resolution.}
  spec.homepage      = "https://github.com/rmosolgo/graphql-parallel"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^spec/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "graphql", "~>0.8"
  spec.add_runtime_dependency "celluloid", "~>0.17"

  spec.add_development_dependency "codeclimate-test-reporter", '~>0.4'
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "minitest-focus", "~> 1.1"
  spec.add_development_dependency "minitest-reporters", "~>1.0"
end
