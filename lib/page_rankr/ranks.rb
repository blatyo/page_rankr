require File.expand_path("../trackers", __FILE__)
require File.expand_path("../ranks/alexa_us", __FILE__)
require File.expand_path("../ranks/alexa_global", __FILE__)
require File.expand_path("../ranks/alexa_country", __FILE__)
require File.expand_path("../ranks/google", __FILE__)
require File.expand_path('../ranks/moz_rank', __FILE__)
require File.expand_path('../ranks/domain_authority', __FILE__)
require File.expand_path('../ranks/page_authority', __FILE__)

module PageRankr
  class Ranks
    include Trackers

    alias_method :rank_trackers, :site_trackers
  end
end
