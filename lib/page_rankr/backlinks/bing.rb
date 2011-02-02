require 'typhoeus'

module PageRankr
  class Backlinks
    class Bing
      include Backlink
      
      def request
        @request ||= Typhoeus::Request.new("http://www.bing.com/search", 
            :params => {:q => "link:#{@site.to_s}"}, :method => :get)
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