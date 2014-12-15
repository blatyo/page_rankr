require File.expand_path('../../social', __FILE__)

module PageRankr
  class Socials
    class Google
      include Social

      def url
        # Yandex supplies Google +1 counts in a convenient matter
        'http://share.yandex.ru/gpp.xml'
      end

      def params
        {:url => tracked_url}
      end

      def regex
        /(\d+)/
      end

      def supported_components
        [:subdomain, :path, :scheme]
      end

      def name
        :socials_google
      end
    end
  end
end
