require File.expand_path('../../social', __FILE__)

module PageRankr
  class Socials
    class Twitter
      include Social

      def url
        'http://urls.api.twitter.com/1/urls/count.json'
      end

      def params
        {:url => tracked_url}
      end

      def jsonpath
        'count'
      end

      def supported_components
        [:subdomain, :path, :query]
      end

      def name
        :socials_twitter
      end
    end
  end
end
