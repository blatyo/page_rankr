require 'typhoeus'
require 'cgi'
require 'nokogiri'

module PageRankr
  class Ranks
    class Compete
      include Rank
      
      def xpath
        "//div[@id='rank']/div[@class='number value']/text()"
      end
      
      def request
        @request ||= Typhoeus::Request.new("http://siteanalytics.compete.com/#{CGI.escape(@site.domain)}/")
      end
      
      def clean(rank)
        rank.to_s.gsub(',', '').to_i
      end
    end
  end
end