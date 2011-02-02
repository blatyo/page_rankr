require 'nokogiri'
require 'open-uri'

module PageRankr
  module Index
    attr_reader :indexes
    alias_method :tracked, :indexes
    
    def initialize(site)
      @site = site
      request.on_complete do |response|
        html = Nokogiri::HTML(response.body)
        @indexes = clean(html.at(xpath).to_s)
        @indexes = nil if @indexes.zero?
      end
    end
    
    def clean(backlink_count)
      backlink_count.gsub(/[a-zA-Z,\s\(\)]/, '').to_i
    end
  end
end