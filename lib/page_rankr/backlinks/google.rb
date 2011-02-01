require 'cgi'
require 'json'

module PageRankr
  class Backlinks
    class Google < Backlink
      
      # overloaded to use Google's AJAX search API
      # http://code.google.com/apis/ajaxsearch/documentation/
      def initialize(site)
        @backlinks = clean JSON.parse( open( url(site)).read )["responseData"]["cursor"]["estimatedResultCount"].to_s
      end
      
      def url(site)
        "http://ajax.googleapis.com/ajax/services/search/web?v=1.0&rsz=1&q=link%3A#{CGI.escape(site)}"
      end
    end
  end
end