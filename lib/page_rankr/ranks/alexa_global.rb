require 'open-uri'
require 'cgi'
require 'nokogiri'

module PageRankr
  class Ranks
    class AlexaGlobal
      include Rank
      
      def xpath
        "//popularity/@text"
      end
      
      def url(site)
        "http://data.alexa.com/data?cli=10&dat=snbamz&url=#{CGI.escape(site.to_s)}"
      end
    end
  end
end