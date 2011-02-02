require 'json'

module PageRankr
  class Backlinks
    class Google
      include Backlink
      
      # overloaded to use Google's AJAX search API
      # http://code.google.com/apis/ajaxsearch/documentation/
      def initialize(site)
        @site = site
        request.on_complete do |response|
          json = JSON.parse(response.body)
          @backlinks = clean(json["responseData"]["cursor"]["estimatedResultCount"].to_s)
          @backlinks = nil if @backlinks.zero?
        end
      end
      
      def request
        @request ||= Typhoeus::Request.new("http://ajax.googleapis.com/ajax/services/search/web", 
            :params => {:v => "1.0", :rsz => 1, :q => "link:#{@site.to_s}"}, :method => :get)
      end
    end
  end
end