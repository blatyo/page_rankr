require File.join("page_rankr", "ranks", "alexa")
require File.join("page_rankr", "ranks", "google")

module PageRankr
  class Ranks
    attr_reader :rank_trackers
    
    def initialize
      @rank_trackers = self.class.constants
    end
    
    def lookup(site, *trackers)
      trackers = rank_trackers if trackers.empty?
      
      ranks = {}
      trackers.each do |tracker|
        name, klass = tracker.to_s.capitalize, self.class
        
        next unless klass.const_defined? name
        
        ranks[tracker.to_s.downcase.to_sym] = klass.const_get(name).new(site).rank
      end
      ranks
    end
  end
end