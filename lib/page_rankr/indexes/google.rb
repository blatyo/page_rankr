require File.expand_path('../../index', __FILE__)

module PageRankr
  class Indexes
    class Google
      include Index
      
      def url
        "http://ajax.googleapis.com/ajax/services/search/web"
      end

      def params
        {:v => "1.0", :rsz => 1, :q => "site:#{@site.to_s}"}
      end

      def jsonpath
        "$..estimatedResultCount"
      end
    end
  end
end