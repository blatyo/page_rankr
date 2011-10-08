require File.expand_path('../../index', __FILE__)

module PageRankr
  class Indexes
    class Google
      include Index
      
      def url
        "http://www.google.com/search"
      end

      def params
        {:q => "site:#{@site.to_s}"}
      end

      def xpath
        "//div[@id='resultStats']/text()"
      end
    end
  end
end