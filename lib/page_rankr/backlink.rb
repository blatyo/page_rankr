require 'rubygems'
require 'nokogiri'
require 'open-uri'

module PageRankr
  module Backlink
    attr_reader :backlinks
    alias_method :tracked, :backlinks
    
    def initialize(site)
      @backlinks = clean Nokogiri::HTML(open url(site)).at(xpath).to_s
    end
    
    def clean(backlink_count)
      backlink_count.gsub(/[a-zA-Z,\s\(\)]/, '').to_i
    end
  end
end