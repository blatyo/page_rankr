require File.join(File.dirname(__FILE__), "rank")
require File.join(File.dirname(__FILE__), "ranks", "alexa")
require File.join(File.dirname(__FILE__), "ranks", "google")

module PageRankr
  class Ranks < Tracker
    alias_method :rank_trackers, :site_trackers
  end
end