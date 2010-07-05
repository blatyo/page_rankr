require 'cgi'

module PageRankr
  class Backlinks
    class Google < Backlink
      def url(site)
        "http://www.google.com/search?q=link%3A#{CGI.escape(site)}"
      end
      
      def xpath
        "//div[@id='resultStats']/text()"
      end
    end
  end
end