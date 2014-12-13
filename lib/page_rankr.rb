require File.expand_path("../page_rankr/backlinks", __FILE__)
require File.expand_path("../page_rankr/ranks", __FILE__)
require File.expand_path("../page_rankr/indexes", __FILE__)
require File.expand_path("../page_rankr/proxy_services", __FILE__)
require File.expand_path("../page_rankr/socials", __FILE__)

module PageRankr
  class MethodRequired             < StandardError; end
  class DomainInvalid              < StandardError; end
  class SupportedComponentsInvalid < StandardError; end

  class << self
    attr_accessor :proxy_service

    def backlinks(site, *search_engines)
      Backlinks.new.lookup(Site.new(site), *search_engines)
    end
    alias_method :backlink, :backlinks
    
    def backlink_trackers
      Backlinks.new.backlink_trackers
    end

    def ranks(site, *rank_trackers)
      Ranks.new.lookup(Site.new(site), *rank_trackers)
    end
    alias_method :rank, :ranks
    
    def rank_trackers
      Ranks.new.rank_trackers
    end
    
    def indexes(site, *index_trackers)
      Indexes.new.lookup(Site.new(site), *index_trackers)
    end
    alias_method :index, :indexes
    
    def index_trackers
      Indexes.new.index_trackers
    end

    def socials(site, *social_trackers)
      Socials.new.lookup(Site.new(site), *social_trackers)
    end
    alias_method :social, :socials

    def social_trackers
      Socials.new.social_trackers
    end
  end
end