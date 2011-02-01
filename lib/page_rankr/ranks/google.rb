require "open-uri"
require File.join(File.dirname(__FILE__), "google", "checksum")

module PageRankr
  class Ranks
    class Google
      include Rank
      
      def initialize(site)
        @rank = open(url(site)) {|io| clean(io.read.scan(regex)[0][0])}
      rescue
        @rank = nil
      end
      
      def regex
        /Rank_\d+:\d+:(\d+)/
      end

      def url(site)
        checksum = Checksum.generate(site.to_s)
        "http://toolbarqueries.google.com/search?client=navclient-auto&ch=#{checksum}&features=Rank&q=info:#{site.to_s}"
      end
    end
  end
end