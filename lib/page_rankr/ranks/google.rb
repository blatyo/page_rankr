require File.expand_path('../../rank', __FILE__)
require File.join(File.dirname(__FILE__), "google", "checksum")

module PageRankr
  class Ranks
    class Google
      include Rank
      
      def initialize(site)
        @checksum = Checksum.generate(site.to_s)
        
        super(site)
      end

      def url
        "http://toolbarqueries.google.com/tbr"
      end

      def params
        {:client => "navclient-auto", :ch => @checksum, :features => "Rank", :q => "info:#{@site.to_s}"}
      end
      
      def regex
        /Rank_\d+:\d+:(\d+)/
      end
    end
  end
end