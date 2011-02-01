require 'open-uri'
require 'cgi'
require 'nokogiri'

module PageRankr
  class Ranks < Tracker
    class Compete < Rank
      def xpath
        "//div[@id='rank']/div[@class='number value']/text()"
      end
      
      def url(site)
        "http://siteanalytics.compete.com/#{CGI.escape(site)}/"
      end
      
      def clean(rank)
        rank.to_s.gsub(',', '').to_i
      end
    end
  end
end