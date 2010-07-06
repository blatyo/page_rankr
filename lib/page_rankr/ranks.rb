require File.join("page_rankr", "ranks", "rank")
require File.join("page_rankr", "ranks", "alexa")
require File.join("page_rankr", "ranks", "google")

module PageRankr
  class Ranks < Tracker
    alias_method :rank_trackers, :site_trackers
    
    def initialize
      super
      @site_trackers.delete(:rank)
    end
  end
end