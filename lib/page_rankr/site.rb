require 'public_suffix_service'
require 'delegate'

module PageRankr
  class DomainInvalid < StandardError; end
  
  class Site < DelegateClass(PublicSuffixService::Domain)
    def initialize(site)
      super(PublicSuffixService.parse(clean(site)))
      valid? or raise DomainInvalid, "The domain provided is invalid."
    end
    
    private
    
    def clean(site)
      site = site.split("://").last # remove protocol
      site = site.split("/").first  # remove path
      site.split("?").first         # remove params
    end
  end
end