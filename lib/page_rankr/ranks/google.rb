require 'typhoeus'
require File.join(File.dirname(__FILE__), "google", "checksum")

module PageRankr
  class Ranks
    class Google
      include Rank
      
      def initialize(site)
        @site = site
        @checksum = Checksum.generate(@site.to_s)
        
        request.on_complete do |response|
          @rank = if response.body =~ regex
            clean($1)
          else
            nil
          end
        end
      end
      
      def regex
        /Rank_\d+:\d+:(\d+)/
      end

      def request
        @request ||= Typhoeus::Request.new("http://toolbarqueries.google.com/search",
              :params => {:client => "navclient-auto", :ch => @checksum, :features => "Rank", :q => "info:#{@site.to_s}"})
      end
    end
  end
end