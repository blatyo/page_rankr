require File.expand_path('../../rank', __FILE__)
require File.expand_path('../google/checksum', __FILE__)

module PageRankr
  class Ranks
    class Google
      include Rank

      def initialize(site, options = {})
        @site = PageRankr::Site(site)
        @checksum = Checksum.generate("info:#{tracked_url}")
        
        super(site, options)
      end

      def supported_components
        [:subdomain, :path, :query]
      end

      def url
        "http://toolbarqueries.google.com/tbr"
      end

      def params
        {:client => "navclient-auto", :ch => @checksum, :features => "Rank", :q => "info:#{tracked_url}"}
      end

      def regex
        /Rank_\d+:\d+:(\d+)/
      end

      def name
        :ranks_google
      end
    end
  end
end
