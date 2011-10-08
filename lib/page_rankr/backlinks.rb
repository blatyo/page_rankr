require File.expand_path("../trackers", __FILE__)
require File.join(File.dirname(__FILE__), "backlinks", "alexa")
require File.join(File.dirname(__FILE__), "backlinks", "bing")
require File.join(File.dirname(__FILE__), "backlinks", "google")
require File.join(File.dirname(__FILE__), "backlinks", "yahoo")

module PageRankr
  class Backlinks
    include Trackers
    
    alias_method :backlink_trackers, :site_trackers
  end
end
