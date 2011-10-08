require File.expand_path("../trackers", __FILE__)
require File.expand_path("../backlinks/alexa", __FILE__)
require File.expand_path("../backlinks/bing", __FILE__)
require File.expand_path("../backlinks/google", __FILE__)
require File.expand_path("../backlinks/yahoo", __FILE__)

module PageRankr
  class Backlinks
    include Trackers
    
    alias_method :backlink_trackers, :site_trackers
  end
end
