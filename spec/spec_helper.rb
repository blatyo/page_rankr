require File.join(File.dirname(__FILE__), '..', 'lib', 'page_rankr')
require 'rspec'
require 'fuubar'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = './spec/fixtures/vcr_cassettes'
  c.hook_into :typhoeus
end

RSpec.configure do |c|
  c.formatter = Fuubar
  c.color_enabled = true
end
