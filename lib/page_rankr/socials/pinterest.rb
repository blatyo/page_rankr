require File.expand_path('../../social', __FILE__)

require 'pry'

module PageRankr
  class Socials
    class Pinterest
      include Social

      def url
        'http://api.pinterest.com/v1/urls/count.json'
      end

      def params
        {:url => tracked_url, :callback => '_'}
      end

      def regex
        /(\d+)/
      end

      def supported_components
        [:subdomain, :path, :scheme]
      end

      def name
        :socials_pinterest
      end
    end
  end
end
