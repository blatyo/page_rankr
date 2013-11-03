require File.expand_path('../../rank', __FILE__)

module PageRankr
  class Ranks
    class PageAuthority
      include Rank

      def url
        'http://bagics.com/page-authority.html'
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
        :ranks_page_authority
      end
    end
  end
end