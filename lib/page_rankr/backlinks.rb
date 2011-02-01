require File.join(File.dirname(__FILE__), "backlink")
require File.join(File.dirname(__FILE__), "backlinks", "alexa")
require File.join(File.dirname(__FILE__), "backlinks", "bing")
require File.join(File.dirname(__FILE__), "backlinks", "google")
require File.join(File.dirname(__FILE__), "backlinks", "yahoo")

module PageRankr
  class Backlinks
    include Tracker
    
    alias_method :backlink_trackers, :site_trackers
  end
end
