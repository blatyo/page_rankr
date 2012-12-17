require 'uri'

module PageRankr
  module ProxyServices
    class Random
      def initialize(proxies)
        @proxies = proxies.map{|proxy| URI.parse(proxy)}
      end

      def proxy(name, site)
        @proxies[rand(@proxies.length)]
      end
    end
  end
end