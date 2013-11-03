require File.expand_path('../../rank', __FILE__)

module PageRankr
  class Ranks
    class MozRank
      include Rank

      def url
        'http://bagics.com/moz-rank.html'
      end

      def params
        {:domain => tracked_url}
      end

      def xpath
        '//*[@id="resId"]'
      end

      def supported_components
        [:subdomain, :path, :query]
      end

      def name
        :ranks_moz_rank
      end
    end
  end
end