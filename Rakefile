require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "PageRankr"
    gem.summary = %Q{Easy way to retrieve Google Page Rank, Alexa Rank, and backlink counts}
    gem.description = %Q{Easy way to retrieve Google Page Rank, Alexa Rank, and backlink counts}
    gem.email = "blatyo@gmail.com"
    gem.homepage = "http://github.com/blatyo/page_rankr"
    gem.authors = ["Allen Madsen"]
    gem.add_dependency "nokogiri", ">= 1.4.1"
    gem.add_development_dependency "yard", ">= 0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :yardoc

begin
  require 'yard'
  YARD::Rake::YardocTask.new
rescue LoadError
  task :yardoc do
    abort "YARD is not available. In order to run yardoc, you must: sudo gem install yard"
  end
end
