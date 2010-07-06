require 'cgi'

module PageRankr
  class Backlinks < Tracker
    class Bing < Backlink
      def url(site)
        "http://www.bing.com/search?q=link%3A#{CGI.escape(site)}"
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