module PageRankr
  module Rank
    attr_reader :rank
    alias_method :tracked, :rank
    
    def initialize(site)
      @site = site
      
      request.on_complete do |response|
        html = Nokogiri::HTML(response.body)
        @rank = clean(html.search(xpath))
        @rank = nil if @rank.zero?
      end
    end
    
    def clean(rank)
      rank.to_s.to_i
    end
  end
end