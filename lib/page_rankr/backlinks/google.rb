require 'cgi'

module PageRankr
  class Backlinks < Tracker
    class Google < Backlink
      def url(site)
        "http://www.google.com/search?q=link%3A%22#{CGI.escape(site)}%22"
      end
      
      def xpath
        "//div[@id='resultStats']/text()"
      end
    end
  end
end