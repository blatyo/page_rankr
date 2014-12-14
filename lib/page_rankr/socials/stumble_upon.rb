require File.expand_path('../../social', __FILE__)

module PageRankr
  class Socials
    class StumbleUpon
      include Social

      def url
        'http://www.stumbleupon.com/services/1.01/badge.getinfo'
      end

      def params
        {:url => tracked_url}
      end

      def jsonpath
        'result.views'
      end

      def supported_components
        [:subdomain, :path, :query]
      end

      def name
        :socials_stumble_upon
      end
    end
  end
end
