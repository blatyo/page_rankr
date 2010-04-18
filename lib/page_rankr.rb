path = File.expand_path(File.dirname(__FILE__)) + '/page_rankr/'
require path + 'backlinks'
require path + 'alexa'
require path + 'google'

module PageRankr
  class << self
    def backlinks(site, *search_engines)
      Backlinks.lookup site, *search_engines
    end

    def ranks(site, *rank_trackers)
      ranks = {}
      rank_trackers.each do |tracker|
        case tracker
          when :google
            ranks[tracker] = Google.lookup(site)
          when :alexa
            ranks[tracker] = Alexa.lookup(site)
        end
      end
      ranks
    end
  end
end