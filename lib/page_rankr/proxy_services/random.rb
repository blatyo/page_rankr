module PageRankr
  module ProxyServices
    class Random
      def initialize(proxies)
        @proxies = proxies
      end

      def proxy(name, site)
        @proxies[rand(@proxies.length)]
      end
    end
  end
end