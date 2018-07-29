# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'octopress-befool-theme/version'

Gem::Specification.new do |spec|
  spec.name          = "octopress-befool-theme"
  spec.version       = Octopress::Befool::VERSION
  spec.authors       = ["KIUCHI Satoshinosuke"]
  spec.email         = ["scholar@hayabusa-lab.jp"]
  spec.summary       = %q{A Jekyll theme built on Octopress Ink}
  spec.homepage      = "https://github.com/befool-inc/octopress-befool-theme"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").grep /(lib|assets|README\.md|CHANGELOG\.md)/
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "octopress-ink", "~> 1.0"
  spec.add_runtime_dependency "sass", "~> 3.4"
  spec.add_runtime_dependency "compass"
  spec.add_runtime_dependency "jekyll", ">= 2.0"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "octopress"
  spec.add_development_dependency "clash"

  if RUBY_VERSION >= "2"
    spec.add_development_dependency "octopress-debugger"
  end
end
