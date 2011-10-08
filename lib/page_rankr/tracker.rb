require 'typhoeus'
require 'nokogiri'
require 'json'
require 'jsonpath'
require File.expand_path('../site', __FILE__)

module PageRankr
  module Tracker
    attr_accessor :tracked
    attr_accessor :raw
    attr_accessor :body

    def initialize(site, options = {})
      @site = PageRankr::Site(site)

      @options = {:method => method}
      @options[:params] = params if respond_to? :params
      @options.merge!(options)
      
      request.on_complete do |response|
        self.body = response.body
        self.raw = content(body)
        self.tracked = clean(raw)
      end
    end

    def request
      @request ||= Typhoeus::Request.new(url, @options)
    end

    def method
      :get
    end

    def run
      hydra = Typhoeus::Hydra.new
      hydra.queue request
      hydra.run

      tracked
    end

    def content(body)
      if respond_to? :xpath
        Nokogiri::HTML(body).at(xpath)
      elsif respond_to? :jsonpath
        JsonPath.new(jsonpath).first(body)
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
  end
end