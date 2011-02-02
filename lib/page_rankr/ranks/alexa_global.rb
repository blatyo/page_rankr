require 'typhoeus'
require 'nokogiri'

module PageRankr
  class Ranks
    class AlexaGlobal
      include Rank
      
      def xpath
        "//popularity/@text"
      end
      
      def request
        @request ||= Typhoeus::Request.new("http://data.alexa.com/data",
            :params => {:cli => 10, :dat => "snbamz", :url => @site.to_s})
      end
    end
  end
end