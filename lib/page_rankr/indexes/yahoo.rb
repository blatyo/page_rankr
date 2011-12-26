require File.expand_path('../../index', __FILE__)

module PageRankr
  class Indexes
    class Yahoo
      include Index
      
      def url
        "http://search.yahoo.com/search"
      end
      
      def params
        {:p => "site:#{tracked_url}"}
      end
      
      def xpath
        "//span[@id='resultCount']/text()"
      end
    end
  end
end