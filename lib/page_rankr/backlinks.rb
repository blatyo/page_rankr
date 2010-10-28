require File.join(File.dirname(__FILE__), "backlinks", "backlink")
require File.join(File.dirname(__FILE__), "backlinks", "alexa")
require File.join(File.dirname(__FILE__), "backlinks", "alltheweb")
require File.join(File.dirname(__FILE__), "backlinks", "altavista")
require File.join(File.dirname(__FILE__), "backlinks", "bing")
require File.join(File.dirname(__FILE__), "backlinks", "google")
require File.join(File.dirname(__FILE__), "backlinks", "yahoo")

module PageRankr
  class Backlinks < Tracker
    alias_method :backlink_trackers, :site_trackers
    
    def initialize
      super
      @site_trackers.delete(:backlink)
    end
  end
end
