require "open-uri"
require File.join("page_rankr", "ranks", "google", "checksum")

module PageRankr
  class Ranks < Tracker
    class Google < Rank
      def initialize(site)
        checksum = Checksum.generate(site)
        @rank = begin
          open(url(site, checksum)) {|io| io.read.scan(regex)[0][0].to_i}
        rescue
          -1
        end
      end
      
      def regex
        /Rank_\d+:\d+:(\d+)/
      end

      def url(site, checksum)
        "http://toolbarqueries.google.com/search?client=navclient-auto&ch=#{checksum}&features=Rank&q=info:#{site}"
      end
    end
  end
end