# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ruboty/record_date/version"

Gem::Specification.new do |spec|
  spec.name          = "ruboty-record_date"
  spec.version       = Ruboty::RecordDate::VERSION
  spec.authors       = ["kimromi"]
  spec.email         = ["kimromi4@gmail.com"]

  spec.summary       = %q{record date for Ruboty}
  spec.description   = %q{record date for Ruboty}
  spec.homepage      = "https://github.com/kimromi/ruboty-record_date"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "ruboty"
  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "dotenv"
end
