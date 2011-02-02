require 'typhoeus'
require 'nokogiri'

module PageRankr
  class Ranks
    class AlexaUs
      include Rank
      
      def xpath
        "//reach/@rank"
      end
      
      def request
         @request ||= Typhoeus::Request.new("http://data.alexa.com/data",
              :params => {:cli => 10, :dat => "snbamz", :url => @site.to_s})
      end
    end
  end
end