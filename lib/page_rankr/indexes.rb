require File.expand_path("../trackers", __FILE__)
require File.expand_path("../indexes/bing", __FILE__)
require File.expand_path("../indexes/google", __FILE__)
require File.expand_path("../indexes/yahoo", __FILE__)

module PageRankr
  class Indexes
    include Trackers
    
    alias_method :index_trackers, :site_trackers
  end
end