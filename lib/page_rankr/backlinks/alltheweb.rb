require 'cgi'

module PageRankr
  class Backlinks
    class AllTheWeb
      include Backlink
      
      def url(site)
        "http://www.alltheweb.com/search?q=link%3A#{CGI.escape(site.to_s)}"
      end
      
      def xpath
        "//span[@class='ofSoMany']/text()"
      end
    end
  end
end