path = File.expand_path(File.dirname(__FILE__))
require 'open-uri'
require 'cgi'
require 'nokogiri'
require path + '/page_rankr/backlinks'

module PageRankr
  class << self
    def backlinks(site, *search_engines)
      Backlinks.lookup site, *search_engines
    end
  end
end