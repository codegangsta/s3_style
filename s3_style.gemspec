# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 's3_style/version'

Gem::Specification.new do |spec|
  spec.name          = "s3_style"
  spec.version       = S3Style::VERSION
  spec.authors       = ["Jeremy Saenz"]
  spec.email         = ["jeremy.saenz@gmail.com"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.summary       = %q{Utility for styling variant S3 URLs}
  spec.description   = %q{S3Style is a utility for generating and modifying S3 urls with multiple "style" variants. This is useful for when you are generating thumbnail variants for an image that lives on S3.}
  spec.homepage      = "http://github.com/codegangsta/s3_style"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'activesupport', '>= 3.2.0'

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
