require 'typhoeus'

module PageRankr
  class Backlinks
    class Yahoo
      include Backlink
      
      def request
        @request ||= Typhoeus::Request.new("http://siteexplorer.search.yahoo.com/search",
            :params => {:p => "#{@site.to_s}"}, :method => :get)
      end
      
      def xpath
        "//ol[@id='results-tab']/li[2]/a/text()"
      end
    end
  end
end