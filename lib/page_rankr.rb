require File.join(File.dirname(__FILE__), "page_rankr", "tracker")
require File.join(File.dirname(__FILE__), "page_rankr", "backlinks")
require File.join(File.dirname(__FILE__), "page_rankr", "ranks")
require File.join(File.dirname(__FILE__), "page_rankr", "indexes")

module PageRankr
  class << self
    def backlinks(site, *search_engines)
      Backlinks.new.lookup site, *search_engines
    end
    alias_method :backlink, :backlinks

    def ranks(site, *rank_trackers)
      Ranks.new.lookup site, *rank_trackers
    end
    alias_method :rank, :ranks
    
    def indexes(site, *index_trackers)
      Indexes.new.lookup site, *index_trackers
    end
    alias_method :index, :indexes
    
    def rank_trackers
      Ranks.new.rank_trackers
    end
    
    def backlink_trackers
      Backlinks.new.backlink_trackers
    end
    
    def index_trackers
      Indexes.new.index_trackers
    end
  end
end