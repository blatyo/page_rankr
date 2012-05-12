require File.expand_path("../trackers", __FILE__)
require File.expand_path("../ranks/alexa_us", __FILE__)
require File.expand_path("../ranks/alexa_global", __FILE__)
require File.expand_path("../ranks/google", __FILE__)

module PageRankr
  class Ranks
    include Trackers
    
    alias_method :rank_trackers, :site_trackers
  end
end