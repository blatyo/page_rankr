class Backlinks
  SEARCH_ENGINE_URLS = {
    :google    => "http://www.google.com/search?q=link%3A",
    :bing      => "http://www.bing.com/search?q=link%3A",
    :yahoo     => "http://siteexplorer.search.yahoo.com/search?p=",
    :altavista => "http://www.altavista.com/web/results?q=link%3A",
    :alltheweb => "http://www.alltheweb.com/search?q=link%3A",
    :alexa     => "http://data.alexa.com/data?cli=10&dat=snbamz&url="
  }

  SEARCH_EGNINE_PATHS = {
    :google    => "//p[@id='resultStats']/b[3]/text()",
    :bing      => "//span[@class='sb_count']/text()",
    :yahoo     => "//ol[@id='results-tab']/li[2]/a/text()",
    :altavista => "//a[@class='lbl']/text()",
    :alltheweb => "//span[@class='ofSoMany']/text()",
    :alexa     => "//linksin/@num"
  }

  def self.lookup(site, *search_engines)
    backlinks = {}
    search_engines.each do |engine|
      next unless SEARCH_ENGINE_URLS[engine]
      doc = Nokogiri::HTML(open(SEARCH_ENGINE_URLS[engine] + CGI.escape(site)))
      count = doc.at(SEARCH_EGNINE_PATHS[engine]).to_s
      count = count.gsub('1-10', '').gsub(/[a-zA-Z,\s\(\)]/, '')
      backlinks[engine] = count.to_i
    end
    backlinks
  end
end
