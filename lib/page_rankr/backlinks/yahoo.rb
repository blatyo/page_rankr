require 'cgi'

module PageRankr
  class Backlinks
    class Yahoo < Backlink
      def url(site)
        "http://siteexplorer.search.yahoo.com/search?p=#{CGI.escape(site)}"
      end
      
      def xpath
        "//ol[@id='results-tab']/li[2]/a/text()"
      end
    end
  end
end