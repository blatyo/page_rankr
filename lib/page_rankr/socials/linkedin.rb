require File.expand_path('../../social', __FILE__)

module PageRankr
  class Socials
    class LinkedIn
      include Social

      def url
        'https://www.linkedin.com/countserv/count/share'
      end

      def params
        {:url => tracked_url, :callback => '_', :format => 'json'}
      end

      def jsonpath
        'count'
      end

      def supported_components
        [:subdomain, :path, :query]
      end

      def name
        :socials_linked_in
      end
    end
  end
end
