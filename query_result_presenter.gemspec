# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'query_result_presenter/version'

Gem::Specification.new do |spec|
  spec.name          = "query_result_presenter"
  spec.version       = QueryResultPresenter::VERSION
  spec.authors       = ["Solomon"]
  spec.email         = ["solomon.kahn@gmail.com"]
  spec.description   = %q{Works with query results in hash form. In particular, made to work with the pg gem, but will also work with any query result represented as a hash.}
  spec.summary       = %q{Adds some functionality to query results using the presenter pattern. Delegates to the underlying object using method missing for a non-recognized method.}
  spec.homepage      = "https://www.github.com/paperless-post/query_result_presenter"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
