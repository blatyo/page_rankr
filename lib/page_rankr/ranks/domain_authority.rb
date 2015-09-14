require File.expand_path('../../rank', __FILE__)

module PageRankr
  class Ranks
    class DomainAuthority
      include Rank

      def url
        'https://moz.com/researchtools/ose/api/urlmetrics'
      end

      def params
        {:site => tracked_url}
      end

      def jsonpath
        'data.authority.domain_authority'
      end

      def supported_components
        [:subdomain, :path, :query]
      end

      def name
        :ranks_domain_authority
      end
    end
  end
end
