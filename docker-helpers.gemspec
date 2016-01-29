# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'docker/helpers/version'

Gem::Specification.new do |spec|
  spec.name          = "docker-helpers"
  spec.version       = Docker::Helpers::VERSION
  spec.authors       = ["Reppard Walker", "Jonathan Niesen"]
  spec.email         = ["reppard.walker@manheim.com"]

  spec.summary       = 'Collection of helpers to supplement the docker-api gem'
  spec.description   = 'Provides some helpers to assist in testing/developing with the docker-api gem.'
  spec.homepage      = "https://github.com/manheim/docker-helpers"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3"
  spec.add_runtime_dependency     "docker-api", "~> 1.26", ">= 1.26.0"
end
