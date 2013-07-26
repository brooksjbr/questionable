$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "askaquestion/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "askaquestion"
  s.version     = Askaquestion::VERSION
  s.authors     = ["Brooks Robertson"]
  s.email       = ["brobertson@everydayhealthinc.com"]
  s.homepage    = ""
  s.summary     = "Ask a question mountable plugin"
  s.description = "Ask a question mountable plugin"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "sqlite3"
  
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "guard-spork"
end
