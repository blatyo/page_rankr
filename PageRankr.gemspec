require File.expand_path("../lib/page_rankr/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "PageRankr"
  s.version     = PageRankr::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Allen Madsen"]
  s.email       = ["blatyo@gmail.com"]
  s.license     = 'MIT'
  s.homepage    = "http://github.com/blatyo/page_rankr"
  s.summary     = "Easy way to retrieve Google Page Rank, Alexa Rank, backlink counts, index counts and different types of social signals"
  s.description = "Easy way to retrieve Google Page Rank, Alexa Rank, backlink counts, index counts and different types of social signals"

  s.required_rubygems_version = ">= 1.3.6"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec",   ">= 2.6.0"
  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "fuubar",  ">= 0.0.1"
  s.add_development_dependency "vcr",     ">= 3.0.3"
  s.add_development_dependency "webmock"

  s.add_runtime_dependency "nokogiri",              ">= 1.4.1"
  s.add_runtime_dependency "json",                  ">= 1.4.6"
  s.add_runtime_dependency "public_suffix",         "~> 3.0"
  s.add_runtime_dependency "httparty",              ">= 0.9.0"
  s.add_runtime_dependency "jsonpath",              ">= 0.4.2"
  s.add_runtime_dependency "addressable"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_paths = ["lib"]
end
