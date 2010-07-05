require 'open-uri'
require 'cgi'
require 'nokogiri'

module PageRankr
  class Ranks
    class Alexa
      attr_reader :rank
    
      def initialize(site)
        @rank = Nokogiri::HTML(open(url(site))).search(xpath).to_s.to_i
      end
      
      def xpath
        "//reach/@rank"
      end
      
      def url(site)
        "http://data.alexa.com/data?cli=10&dat=snbamz&url=#{CGI.escape(site)}"
      end
    end
  end
end