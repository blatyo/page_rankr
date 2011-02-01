require 'cgi'

module PageRankr
  class Backlinks
    class Alexa
      include Backlink
      
      def url(site)
        "http://data.alexa.com/data?cli=10&dat=snbamz&url=#{CGI.escape(site.to_s)}"
      end
      
      def xpath
        "//linksin/@num"
      end
    end
  end
end