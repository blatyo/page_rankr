require 'rubygems'
require 'nokogiri'
require 'open-uri'

module PageRankr
  module Backlink
    attr_reader :backlinks
    alias_method :tracked, :backlinks
    
    def initialize(site)
      @site = site
      
      request.on_complete do |response|
        html = Nokogiri::HTML(response.body)
        @backlinks = clean(html.at(xpath).to_s)
        @backlinks = nil if @backlinks.zero?
      end
    end
    
    def clean(backlink_count)
      backlink_count.gsub(/[a-zA-Z,\s\(\)]/, '').to_i
    end
  end
end