require File.join("page_rankr", "backlinks")
require File.join("page_rankr", "ranks")

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
  end
end