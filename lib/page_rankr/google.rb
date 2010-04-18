path = File.expand_path(File.dirname(__FILE__)) + '/google/'
require "open-uri"
require path + 'checksum'

module PageRankr
  module Google
    class << self
      def lookup(site)
        checksum = Checksum.generate(site)
        begin
          open(url(site, checksum)) {|io| io.read.scan(/Rank_\d+:\d+:(\d+)/)[0][0].to_i}
        rescue
          -1
        end
      end

      private

      def url(site, checksum)
        "http://toolbarqueries.google.com/search?client=navclient-auto&ch=#{checksum}&features=Rank&q=info:#{site}"
      end
    end
  end
end