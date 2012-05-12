module PageRankr
  module ProxyServices
    class Random
      def initialize(proxies)
        @proxies = proxies
      end

      def proxy(class_name, site)
        @proxies[rand(@proxies.length)]
      end
    end
  end
end