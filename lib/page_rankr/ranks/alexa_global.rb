require File.expand_path('../../rank', __FILE__)

module PageRankr
  class Ranks
    class AlexaGlobal
      include Rank

      def url
        "http://data.alexa.com/data"
      end

      def params
        {:cli => 10, :dat => "snbamz", :url => tracked_url}
      end

      # Alexa may sometimes return a result for the incorrect site and thus it is necessary to check if
      # the results returned are for the site we want.
      #
      # For example, slocourts.net returns results for ca.gov, presumably because www.slocourts.ca.gov redirects
      # to slocourts.net. Clearly something is wrong with how Alexa handles this case and so in the event this
      # happens we treat the results as if there were no results.
      def xpath
         "//popularity/@text"
      end

      def supported_components
        [:subdomain]
      end

      def name
        :ranks_alexa_global
      end
    end
  end
end
