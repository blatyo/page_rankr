require File.expand_path('../../backlink', __FILE__)

module PageRankr
  class Backlinks
    class Google
      include Backlink

      def url
        "http://ajax.googleapis.com/ajax/services/search/web"
      end

      def params
        {:v => "1.0", :rsz => 1, :q => "link:#{@site.to_s}"}
      end

      def jsonpath
        "$..esimatedResultCount"
      end
    end
  end
end