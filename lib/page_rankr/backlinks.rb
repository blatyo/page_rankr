require File.join("page_rankr", "backlinks", "backlink")
require File.join("page_rankr", "backlinks", "alexa")
require File.join("page_rankr", "backlinks", "alltheweb")
require File.join("page_rankr", "backlinks", "altavista")
require File.join("page_rankr", "backlinks", "bing")
require File.join("page_rankr", "backlinks", "google")
require File.join("page_rankr", "backlinks", "yahoo")

module PageRankr
  class Backlinks
    attr_accessor :search_engines
    
    def initialize
      @search_engines = self.class.constants
      @search_engines.delete(:Backlink)
    end

    def lookup(site, *engines)
      engines = search_engines if engines.empty?
      
      backlinks = {}
      engines.each do |engine|
        name, klass = engine.to_s.capitalize, self.class
        
        next unless klass.const_defined? name
        
        backlinks[engine.to_s.downcase.to_sym] = klass.const_get(name).new(site).backlinks
      end
      backlinks
    end
  end
end
