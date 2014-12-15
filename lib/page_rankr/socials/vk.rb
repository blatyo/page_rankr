require File.expand_path('../../social', __FILE__)

module PageRankr
  class Socials
    class Vk
      include Social

      def url
        'http://vk.com/share.php'
      end

      def params
        {:url => tracked_url, :act => 'count'}
      end

      def regex
        /, (\d+)/
      end

      def supported_components
        [:subdomain, :path, :scheme]
      end

      def name
        :socials_vk
      end
    end
  end
end
