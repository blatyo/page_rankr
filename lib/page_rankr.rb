require File.join(File.dirname(__FILE__), "page_rankr", "backlinks")
require File.join(File.dirname(__FILE__), "page_rankr", "ranks")
require File.join(File.dirname(__FILE__), "page_rankr", "indexes")

module PageRankr
  class MethodRequired < StandardError; end
  class DomainInvalid  < StandardError; end

  class << self
    def backlinks(site, *search_engines)
      Backlinks.new.lookup(Site.new(site), *search_engines)
    end
    alias_method :backlink, :backlinks
    
    def backlink_trackers
      Backlinks.new.backlink_trackers
    end

    def ranks(site, *rank_trackers)
      Ranks.new.lookup(Site.new(site), *rank_trackers)
    end
    alias_method :rank, :ranks
    
    def rank_trackers
      Ranks.new.rank_trackers
    end
    
    def indexes(site, *index_trackers)
      Indexes.new.lookup(Site.new(site), *index_trackers)
    end
    alias_method :index, :indexes
    
    def index_trackers
      Indexes.new.index_trackers
    end
  end
end