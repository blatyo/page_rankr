module PageRankr
  module ProxyServices
    class RoundRobin
      def initialize(proxies)
        @proxies = proxies.map{|proxy| URI.parse(proxy)}
        @index = 0
      end

      def proxy(name, site)
        @proxies[@index].tap do
          @index = (@index + 1) % @proxies.length
        end
      end
    end
  end
end