require File.join(File.dirname(__FILE__), '..', 'lib', 'page_rankr')
require 'rspec'
require 'fuubar'
require 'vcr'
require 'webmock'
require 'pry'
require 'support/custom_matchers'

WebMock.allow_net_connect!

VCR.configure do |c|
  c.cassette_library_dir = './spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end

RSpec.configure do |c|
  c.formatter = Fuubar
  c.color = true
end
