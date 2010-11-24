require 'cgi'

module PageRankr
  class Indexes < Tracker
    class Bing < Index
      def url(site)
        "http://www.bing.com/search?q=site%3A#{CGI.escape(site)}"
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