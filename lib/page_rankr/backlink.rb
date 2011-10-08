require File.expand_path('../tracker', __FILE__)

module PageRankr
  module Backlink
    include Tracker

    alias_method :backlink, :tracked
  end
end