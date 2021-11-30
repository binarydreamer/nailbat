lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "nailbat/version"

Gem::Specification.new do |s|
  s.name        = 'nailbat'
  s.version     = Nailbat::VERSION
  s.authors     = ["Ryan Slack"]
  s.email       = ['ryan@binarydreamer.com']

  s.summary     = "Nailbat Script Manager"
  s.homepage    = 'https://github.com/binarydreamer/nailbat'
  s.license     = 'MIT'

  s.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.executables   = Dir['bin/*'].map { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  s.add_development_dependency "bundler", "~> 1.17"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "minitest", "~> 5.0"

  s.add_runtime_dependency "tty-prompt"
end
