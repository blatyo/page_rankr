require 'cgi'

module PageRankr
  class Backlinks
    class Altavista
      include Backlink
      
      def url(site)
        "http://www.altavista.com/web/results?q=link%3A#{CGI.escape(site.to_s)}"
      end
      
      def xpath
        "//a[@class='lbl']/text()"
      end
    end
  end
end