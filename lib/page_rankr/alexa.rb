require 'open-uri'
require 'cgi'
require 'nokogiri'

module PageRankr
  class Alexa
    class << self
      def lookup(site)
        url = "http://data.alexa.com/data?cli=10&dat=snbamz&url="
        Nokogiri::HTML(open(url + CGI.escape(site))).search("//reach/@rank").to_s.to_i
      end
    end
  end
end