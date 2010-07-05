require 'cgi'

module PageRankr
  class Backlinks
    class Alltheweb < Backlink
      def url(site)
        "http://www.alltheweb.com/search?q=link%3A#{CGI.escape(site)}"
      end
      
      def xpath
        "//span[@class='ofSoMany']/text()"
      end
    end
  end
end