module PageRankr
  class Rank
    attr_reader :rank
    alias_method :tracked, :rank
  end
end