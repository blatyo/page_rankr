require 'open-uri'
require 'cgi'
require 'nokogiri'

module PageRankr
  class Ranks
    class AlexaUs < Rank
      def xpath
        "//reach/@rank"
      end
      
      def url(site)
        "http://data.alexa.com/data?cli=10&dat=snbamz&url=#{CGI.escape(site)}"
      end
    end
  end
end