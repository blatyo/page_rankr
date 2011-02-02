require 'typhoeus'

module PageRankr
  class Indexes
    class Bing
      include Index
      
      def request
        @request ||= Typhoeus::Request.new("http://www.bing.com/search",
            :params => {:q => "site:#{@site.to_s}"})
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