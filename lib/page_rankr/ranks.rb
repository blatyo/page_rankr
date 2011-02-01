require File.join(File.dirname(__FILE__), "rank")
require File.join(File.dirname(__FILE__), "ranks", "alexa_us")
require File.join(File.dirname(__FILE__), "ranks", "alexa_global")
require File.join(File.dirname(__FILE__), "ranks", "google")
require File.join(File.dirname(__FILE__), "ranks", "compete")

module PageRankr
  class Ranks
    include Tracker
    
    alias_method :rank_trackers, :site_trackers
  end
end