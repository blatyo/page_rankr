require File.expand_path('../../rank', __FILE__)
require File.expand_path('../google/checksum', __FILE__)

module PageRankr
  class Ranks
    class Google
      include Rank

      def initialize(site)
        @site = PageRankr::Site(site)
        @checksum = Checksum.generate("info:#{tracked_site}")
        
        super(site)
      end

      def supported_components
        [:subdomain, :path]
      end

      def url
        "http://toolbarqueries.google.com/tbr"
      end

      def params
        {:client => "navclient-auto", :ch => @checksum, :features => "Rank", :q => "info:#{@site.to_s}"}
      end

      def regex
        /Rank_\d+:\d+:(\d+)/
      end
    end
  end
end
