require 'nokogiri'
require 'open-uri'

module PageRankr
  module Index
    attr_reader :indexes
    alias_method :tracked, :indexes
    
    def initialize(site)
      html = Nokogiri::HTML(open url(site))
      @indexes = clean(html.at(xpath).to_s)
    end
    
    def clean(backlink_count)
      backlink_count.gsub(/[a-zA-Z,\s\(\)]/, '').to_i
    end
  end
end