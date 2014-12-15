require File.expand_path('../../social', __FILE__)

module PageRankr
  class Socials
    class Facebook
      include Social

      def url
        'http://graph.facebook.com'
      end

      def params
        {:id => tracked_url}
      end

      def jsonpath
        'shares'
      end

      def supported_components
        [:subdomain, :path, :query, :scheme]
      end

      def name
        :socials_facebook
      end
    end
  end
end
