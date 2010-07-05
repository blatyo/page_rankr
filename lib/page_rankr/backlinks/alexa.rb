require 'cgi'

module PageRankr
  class Backlinks
    class Alexa < Backlink
      def url(site)
        "http://data.alexa.com/data?cli=10&dat=snbamz&url=#{CGI.escape(site)}"
      end
      
      def xpath
        "//linksin/@num"
      end
    end
  end
end