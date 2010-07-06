require File.join("page_rankr", "backlinks", "backlink")
require File.join("page_rankr", "backlinks", "alexa")
require File.join("page_rankr", "backlinks", "alltheweb")
require File.join("page_rankr", "backlinks", "altavista")
require File.join("page_rankr", "backlinks", "bing")
require File.join("page_rankr", "backlinks", "google")
require File.join("page_rankr", "backlinks", "yahoo")

module PageRankr
  class Backlinks < Tracker
    alias_method :backlink_trackers, :site_trackers
    
    def initialize
      super
      @site_trackers.delete(:backlink)
    end
  end
end
