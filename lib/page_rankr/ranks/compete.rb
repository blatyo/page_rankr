require 'open-uri'
require 'cgi'
require 'nokogiri'

module PageRankr
  class Ranks < Tracker
    class Compete < Rank
      def initialize(site)
        @rank = Nokogiri::HTML(open(url(site))).search(xpath).to_s.gsub(',', '').to_i
      rescue
        @rank = 0 #compete only accepts urls without http:// and www, will be fixed in 2.0
      end
      
      def xpath
        "//div[@id='rank']/div[@class='number value']/text()"
      end
      
      def url(site)
        "http://siteanalytics.compete.com/#{CGI.escape(site)}/"
      end
    end
  end
end