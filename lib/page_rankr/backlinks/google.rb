require File.expand_path('../../backlink', __FILE__)

module PageRankr
  class Backlinks
    class Google
      include Backlink

      def url
        "http://www.google.com/search"
      end

      def params
        {:q => "link:#{tracked_url}"}
      end

      def xpath
        "//div[@id='subform_ctrl']/div[2]/text()"
      end

      def name
        :backlinks_google
      end
    end
  end
end