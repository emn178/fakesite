$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "fakesite/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "fakesite"
  s.version     = Fakesite::VERSION
  s.authors     = ["Chen Yi-Cyuan"]
  s.email       = ["emn178@gmail.com"]
  s.homepage    = "https://github.com/emn178/fakesite"
  s.summary     = "An rails plugin that provides a stub framework to stub 3-party redirect page such as payment or oauth login."
  s.description = "An rails plugin that provides a stub framework to stub 3-party redirect page such as payment or oauth login."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", ">= 4.0.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "bundler", "~> 1.10"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "rspec-its"
end
