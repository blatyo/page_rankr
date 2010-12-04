require 'open-uri'
require 'cgi'
require 'nokogiri'

module PageRankr
  class Ranks < Tracker
    class Alexa < Rank
      def initialize(site)
        @rank = {}
        xpath.each_key do |key|
          @rank[key] = Nokogiri::HTML(open(url(site))).search(xpath[key]).to_s.to_i
        end
        @rank
      end
      
      def xpath
        { :us     => "//reach/@rank", 
          :global => "//popularity/@text" }
      end
      
      def url(site)
        "http://data.alexa.com/data?cli=10&dat=snbamz&url=#{CGI.escape(site)}"
      end
    end
  end
end