require 'cgi'

module PageRankr
  class Indexes
    class Bing
      include Index
      
      def url(site)
        "http://www.bing.com/search?q=site%3A#{CGI.escape(site.to_s)}"
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