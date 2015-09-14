require File.expand_path('../../backlink', __FILE__)

module PageRankr
  class Backlinks
    class Yahoo
      include Backlink

      def url
        "http://search.yahoo.com/search"
      end

      def params
        {:p => "inbody:#{tracked_url}"}
      end

      def xpath
        "//div[@class='compPagination']/span/text()"
      end

      def name
        :backlinks_yahoo
      end
    end
  end
end
