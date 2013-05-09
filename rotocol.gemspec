# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rotocol/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Hao Liu"]
  gem.email         = ["leomayleomay@gmail.com"]
  gem.description   = %q{Bring the Objective-C like protocol to Ruby}
  gem.summary       = %q{}
  gem.homepage      = "https://github.com/leomayleomay/rotocol"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rotocol"
  gem.require_paths = ["lib"]
  gem.version       = Rotocol::VERSION
end
