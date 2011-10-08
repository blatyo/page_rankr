require File.expand_path('../tracker', __FILE__)

module PageRankr
  module Index
    include Tracker

    alias_method :index, :tracked
  end
end