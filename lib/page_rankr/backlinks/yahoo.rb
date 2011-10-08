require File.expand_path('../../backlink', __FILE__)

module PageRankr
  class Backlinks
    class Yahoo
      include Backlink
      
      def url
        "http://siteexplorer.search.yahoo.com/search"
      end
      def params
        {:p => "#{@site.to_s}"}
      end
      
      def xpath
        "//ul[@id='result-details']/li[2]/a/text()"
      end
    end
  end
end