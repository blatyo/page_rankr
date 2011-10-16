require 'public_suffix_service'
require 'delegate'

module PageRankr
  class Site < DelegateClass(PublicSuffixService::Domain)
    def initialize(site)
      super(PublicSuffixService.parse(clean(site)))
      valid? or raise DomainInvalid, "The domain provided is invalid."
    rescue PublicSuffixService::DomainInvalid => e
      raise DomainInvalid, "The domain provided is invalid."
    end
    
    private
    
    def clean(site)
      site = site                   || ''
      site = site.split("://").last || '' # remove protocol
      site = site.split("/").first  || '' # remove path
      site.split("?").first         || '' # remove params
    end
  end

  class << self
    def Site(site)
      site.respond_to?(:domain) ? site : Site.new(site)
    end
  end
end