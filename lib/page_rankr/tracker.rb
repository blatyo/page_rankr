require 'typhoeus'
require 'nokogiri'
require 'json'
require 'jsonpath'

module PageRankr
  module Tracker
    def initialize(site)
      @site = site
      
      request.on_complete do |response|
        clean(content(response.body))
      end
    end

    def request
      @request if defined?(@request) && @request

      options = {:method => method}
      options[:params] = params if respond_to? :params

      Typhoeus::Request.new(url, options)
    end

    def tracked
      request.handled_response
    end

    def method
      :get
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
      end
    end
    
    def clean(content)
      return content if content.nil?
      content.to_s.gsub(/[a-zA-Z,\s\(\)]/, '').to_i
    end
  end
end