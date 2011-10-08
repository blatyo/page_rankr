require File.expand_path('../../backlink', __FILE__)

module PageRankr
  class Backlinks
    class Google
      include Backlink

      def url
        "http://www.google.com/search"
      end

      def params
        {:q => "link:#{@site.to_s}"}
      end

      def xpath
        "//div[@id='resultStats']/text()"
      end
    end
  end
end