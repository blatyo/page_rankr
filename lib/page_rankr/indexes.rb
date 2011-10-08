require File.expand_path("../trackers", __FILE__)
require File.join(File.dirname(__FILE__), "indexes", "bing")
require File.join(File.dirname(__FILE__), "indexes", "google")

module PageRankr
  class Indexes
    include Trackers
    
    alias_method :index_trackers, :site_trackers
  end
end