require 'public_suffix_service'
require 'delegate'
require 'uri'

module PageRankr
  class Site
    COMPONENTS = [:scheme, :subdomain, :domain, :port, :path, :query, :fragment]

    def initialize(site)
      @uri = URI.parse(site)
      @domain = PublicSuffixService.parse(@uri.host)

      @domain.valid? or raise DomainInvalid, "The domain provided is invalid.1"
    rescue PublicSuffixService::DomainInvalid, URI::InvalidURIError
      raise DomainInvalid, "The domain provided is invalid."
    end

    def scheme
      @uri.scheme
    end

    def domain
      @domain.domain
    end

    def subdomain
      @domain.subdomain or domain
    end

    def port
      @uri.port
    end

    def path
      @uri.path
    end

    def query
      @uri.query
    end

    def fragment
      @uri.fragment
    end

    def url(supported_components = [:domain])
      supported_components = COMPONENTS & supported_components #get ordered list

      unless supported_components.include?(:subdomain) ^ supported_components.include?(:domain)
        raise SupportedComponentsInvalid, "Either subdomain or domain should be set as a supported component, not both."
      end

      supported_components.inject("") do |url, component|
        url + case component
        when :scheme
          scheme and "#{scheme}://" or ""
        when :domain
          domain
        when :subdomain
          subdomain
        when :port
          port == @uri.default_port and "" or ":#{port}"
        when :path
          path or ""
        when :query
          query and "?#{query}" or ""
        when :fragment
          fragment and "##{fragment}" or ""
        end
      end
    end
  end

  class << self
    def Site(site)
      site.respond_to?(:url) ? site : Site.new(site)
    end
  end
end