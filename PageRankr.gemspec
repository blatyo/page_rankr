File.expand_path("../lib/page_rankr/version", __FILE__)

Gem::Specification.new do |s|
  s.name = %q{PageRankr}
  s.version = PageRankr::VERSION

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Allen Madsen"]
  s.date = %q{2010-07-07}
  s.description = %q{Easy way to retrieve Google Page Rank, Alexa Rank, and backlink counts}
  s.email = %q{blatyo@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.md",
     "README.md"
  ]
  
  s.files `git ls-files`.split("\n")
  s.test_files   = `git ls-files`.split("\n").map{|f| f =~ /^spec\/(.*)/ ? $1 : nil}.compact
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.homepage = %q{http://github.com/blatyo/page_rankr}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.0}
  s.summary = %q{Easy way to retrieve Google Page Rank, Alexa Rank, and backlink counts}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, [">= 1.4.1"])
    else
      s.add_dependency(%q<nokogiri>, [">= 1.4.1"])
    end
  else
    s.add_dependency(%q<nokogiri>, [">= 1.4.1"])
  end
end

