require File.expand_path('../../backlink', __FILE__)

module PageRankr
  class Backlinks
    class Bing
      include Backlink
            
      def url
        "http://www.bing.com/search"
      end

      def params
        {:q => "inbody:#{tracked_url}"}
      end

      def xpath
        "//span[@class='sb_count']/text()"
      end
      
      def clean(backlink_count)
        super(backlink_count.gsub('1-10', ''))
      end

      def name
        :backlinks_bing
      end
    end
  end
end