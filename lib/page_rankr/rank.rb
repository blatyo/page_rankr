require File.expand_path('../tracker', __FILE__)

module PageRankr
  module Rank
    include Tracker
  
    alias_method :rank, :tracked
  end
end