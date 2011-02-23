require 'typhoeus'
require 'nokogiri'

module PageRankr
  class Ranks
    class AlexaGlobal
      include Rank
      
      # Alexa may sometimes return a result for the incorrect site and thus it is necessary to check if
      # the results returned are for the site we want.
      #
      # For example, slocourts.net returns results for ca.gov, presumably because www.slocourts.ca.gov redirects
      # to slocourts.net. Clearly something is wrong with how Alexa handles this case and so in the event this
      # happens we treat the results as if there were no results.
      def xpath
         "//popularity[contains(@url, '#{@site.domain}')]/@text"
      end
      
      def request
        @request ||= Typhoeus::Request.new("http://data.alexa.com/data",
            :params => {:cli => 10, :dat => "snbamz", :url => @site.to_s})
      end
    end
  end
end