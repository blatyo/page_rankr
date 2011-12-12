require File.expand_path('../../index', __FILE__)

module PageRankr
  class Indexes
    class Bing
      include Index
      
      def url
        "http://www.bing.com/search"
      end

      def params
        {:q => "site:#{tracked_url}"}
      end
      
      def xpath
        "//span[@class='sb_count']/text()"
      end
      
      def clean(backlink_count)
        super(backlink_count.gsub('1-10', ''))
      end
    end
  end
end