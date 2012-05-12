require File.expand_path('../../rank', __FILE__)
require 'cgi'

module PageRankr
  class Ranks
    class Compete
      include Rank
      
      def url
        "http://siteanalytics.compete.com/#{CGI.escape(@site.domain)}/"
      end

      def xpath
        "//div[@class='section score']/h4[2]/text()"
      end

      def name
        :ranks_compete
      end
    end
  end
end
