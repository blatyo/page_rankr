require File.expand_path('../social', __FILE__)

module PageRankr
  module Social
    include Tracker

    alias_method :social, :tracked
  end
end