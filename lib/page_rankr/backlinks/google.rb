require 'cgi'
require 'json'

module PageRankr
  class Backlinks
    class Google
      include Backlink
      
      # overloaded to use Google's AJAX search API
      # http://code.google.com/apis/ajaxsearch/documentation/
      def initialize(site)
        json = JSON.parse( open( url(site.to_s)).read )
        @backlinks = clean(json["responseData"]["cursor"]["estimatedResultCount"].to_s)
        @backlinks = nil if @backlinks.zero?
      end
      
      def url(site)
        "http://ajax.googleapis.com/ajax/services/search/web?v=1.0&rsz=1&q=link%3A#{CGI.escape(site.to_s)}"
      end
    end
  end
end