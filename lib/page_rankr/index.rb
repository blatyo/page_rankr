require 'nokogiri'
require 'open-uri'

module PageRankr
  class Index
    attr_reader :indexes
    alias_method :tracked, :indexes
    
    def initialize(site)
      @indexes = clean Nokogiri::HTML(open url(site)).at(xpath).to_s
    end
    
    def clean(backlink_count)
      backlink_count.gsub(/[a-zA-Z,\s\(\)]/, '').to_i
    end
  end
end