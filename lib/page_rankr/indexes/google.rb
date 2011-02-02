require 'typhoeus'
require 'json'

module PageRankr
  class Indexes
    class Google
      include Index
      
      # overloaded to use Google's AJAX search API
      # http://code.google.com/apis/ajaxsearch/documentation/
      def initialize(site)
        @site = site
        
        request.on_complete do |response|
          json = JSON.parse(response.body)
          @indexes = clean(json["responseData"]["cursor"]["estimatedResultCount"].to_s)
          @indexes = nil if @indexes.zero?
        end
      end
      
      def request
        @request ||= Typhoeus::Request.new("http://ajax.googleapis.com/ajax/services/search/web",
            :params => {:v => "1.0", :rsz => 1, :q => "site:#{@site.to_s}"}, :method => :get)
      end
    end
  end
end