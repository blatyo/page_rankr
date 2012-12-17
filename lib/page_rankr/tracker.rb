require 'nokogiri'
require 'json'
require 'jsonpath'
require File.expand_path('../site', __FILE__)
require File.expand_path('../request', __FILE__)

module PageRankr
  module Tracker
    attr_accessor :tracked
    attr_accessor :raw
    attr_accessor :body

    def initialize(site, options = {})
      @site = PageRankr::Site(site)
      @options = options
    end

    def url
      raise PageRankr::MethodRequired, "A url method defining the url to the service with the value you wish to extract must be defined."
    end

    def tracked_url
      @site.url(supported_components)
    end

    def supported_components
      [:subdomain]
    end

    def method
      :get
    end

    def proxy
      PageRankr.proxy_service.proxy(name, @site) if PageRankr.proxy_service
    end

    def run
      PageRankr::Request.new(self, @options).perform do |body|
        self.body = body
        self.raw = content(body)
        self.tracked = clean(raw)
      end

      tracked
    end

    def content(body)
      if respond_to? :xpath
        Nokogiri::HTML(body).at(xpath)
      elsif respond_to? :jsonpath
        JsonPath.new(jsonpath).first(JSON.parse(body))
      elsif respond_to? :regex
        body =~ regex ? $1 : nil
      else
        raise PageRankr::MethodRequired, "A method for extracting the value must be defined. Either xpath, jsonpath, or regex."
      end.to_s
    end
    
    def clean(content)
      cleaned_content = content.to_s.gsub(/\D/, '')

      if cleaned_content.strip == ''
        nil
      else
        cleaned_content.to_i
      end
    end

    def name
      raise PageRankr::MethodRequired, "name is undefined for #{self.class.name}"
    end
  end
end