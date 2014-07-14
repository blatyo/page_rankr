require File.join(File.dirname(__FILE__), '..', 'lib', 'page_rankr')
require 'rspec'
require 'fuubar'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = './spec/fixtures/vcr_cassettes'
  c.hook_into :fakeweb
  c.default_cassette_options = {
    :record => :once,
    :match_requests_on => [
      :method,
      VCR.request_matchers.uri_without_param(
        :cli,
        :dat,
        :client,
        :features
      )
    ]
  }
end

RSpec.configure do |c|
  c.formatter = Fuubar
  c.color = true
end
