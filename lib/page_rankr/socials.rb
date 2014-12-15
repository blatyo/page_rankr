require File.expand_path("../trackers", __FILE__)
require File.expand_path("../socials/facebook", __FILE__)
require File.expand_path("../socials/google", __FILE__)
require File.expand_path("../socials/linkedin", __FILE__)
require File.expand_path("../socials/pinterest", __FILE__)
require File.expand_path("../socials/stumble_upon", __FILE__)
require File.expand_path("../socials/twitter", __FILE__)
require File.expand_path("../socials/vk", __FILE__)

module PageRankr
  class Socials
    include Trackers

    alias_method :social_trackers, :site_trackers
  end
end
