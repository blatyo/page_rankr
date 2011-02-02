require 'typhoeus'

module PageRankr
  class Backlinks
    class Alexa
      include Backlink
      
      def request
        @request ||= Typhoeus::Request.new("http://data.alexa.com/data",
            :params => {:cli => 10, :dat => "snbamz", :url => @site.to_s}, :method => :get)
      end
      
      def xpath
        "//linksin/@num"
      end
    end
  end
end