require 'cgi'

module PageRankr
  class Backlinks
    class Bing
      include Backlink
      def url(site)
        "http://www.bing.com/search?q=link%3A#{CGI.escape(site.to_s)}"
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