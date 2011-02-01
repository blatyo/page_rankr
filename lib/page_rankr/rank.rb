module PageRankr
  class Rank
    attr_reader :rank
    alias_method :tracked, :rank
    
    def initialize(site)
      html = Nokogiri::HTML(open(url(site)))
      @rank = clean(html.search(xpath))
    end
    
    def clean(rank)
      rank.to_s.to_i
    end
  end
end