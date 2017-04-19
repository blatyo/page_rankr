require 'public_suffix'
require 'delegate'
require 'addressable/uri'

module PageRankr
  class Site
    COMPONENTS = [:scheme, :subdomain, :domain, :port, :path, :query, :fragment]

    def initialize(site)
      site = "http://#{site}" unless site =~ /:\/\//
      @uri = Addressable::URI.parse(site)
      @domain = public_suffix_parse(@uri.host)

      public_suffix_valid?(@domain) or raise DomainInvalid, "The domain provided is invalid.1"
    rescue PublicSuffix::DomainInvalid, Addressable::URI::InvalidURIError
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
      components = COMPONENTS & supported_components #get ordered list

      unless components.include?(:subdomain) ^ components.include?(:domain)
        raise SupportedComponentsInvalid, "Either subdomain or domain should be set as a supported component, not both."
      end

      components.inject("") do |url, component|
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

    private

    def public_suffix_parse(host = '')
      if public_suffix_verson_1?
        PublicSuffix.parse(host)
      else
        PublicSuffix.parse(host, default_rule: nil)
      end
    end

    def public_suffix_valid?(domain)
      if public_suffix_verson_1?
        domain.valid?
      else
        PublicSuffix.valid?(domain, default_rule: nil)
      end
    end

    def public_suffix_verson_1?
      defined?(PublicSuffix::Version) && PublicSuffix::Version::MAJOR == 1
    end
  end

  class << self
    def Site(site)
      site.respond_to?(:url) ? site : Site.new(site)
    end
  end
end
