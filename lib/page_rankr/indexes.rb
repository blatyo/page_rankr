require File.join(File.dirname(__FILE__), "index")
require File.join(File.dirname(__FILE__), "indexes", "bing")
require File.join(File.dirname(__FILE__), "indexes", "google")

module PageRankr
  class Indexes < Tracker
    alias_method :index_trackers, :site_trackers
  end
end