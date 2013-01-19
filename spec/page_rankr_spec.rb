require 'spec_helper'

RSpec::Matchers.define :be_in do |expected|
  match do |actual|
    expected === actual
  end
  
  failure_message_for_should do |actual|
    "expected that #{actual} would be in #{expected}"
  end
end

RSpec::Matchers.define :be_number do
  match do |actual|
    actual.is_a?(Numeric) && actual.send(@symbol, @expected)
  end

  chain :>= do |expected|
    @symbol = :>=
    @expected = expected
  end
  
  chain :> do |expected|
    @symbol = :>
    @expected = expected
  end

  chain :< do |expected|
    @symbol = :<
    @expected = expected
  end

  chain :<= do |expected|
    @symbol = :<=
    @expected = expected
  end

  failure_message_for_should do |actual|
    "expected that #{actual.inspect} would be a number and #{@symbol} than #{@expected}"
  end
end

describe PageRankr do
  describe "#rank_trackers" do
    subject{ PageRankr.rank_trackers }
    
    it{ should include(:alexa_us) }
    it{ should include(:alexa_global) }
    it{ should include(:google) }
  end

  describe "#ranks", :focus => true do
    describe "success" do
      subject do
        VCR.use_cassette(:success_ranks, :record => :new_episodes) do
          PageRankr.ranks("http://www.google.com")
        end
      end
  
      it{ should have_key(:alexa_us) }
      it{ should have_key(:alexa_global) }
      it{ should have_key(:alexa_country) }
      it{ should have_key(:google) }
    
      it{ subject[:alexa_us].should be_number >= 1 }
      it{ subject[:alexa_global].should be_number >= 1 }
      it{ subject[:alexa_country].should be_number >= 1 }
      it{ subject[:google].should be_in(0..10) }
    end
    
    describe "failure" do
      subject do
        VCR.use_cassette(:failure_ranks, :record => :new_episodes) do
          PageRankr.ranks("http://please-dont-register-a-site-that-breaks-this-test.com")
        end
      end
      
      it{ should have_key(:alexa_us) }
      it{ should have_key(:alexa_global) }
      it{ should have_key(:alexa_country) }
      it{ should have_key(:google) }
    
      it{ subject[:alexa_us].should be_nil }
      it{ subject[:alexa_global].should be_nil }
      it{ subject[:alexa_country].should be_nil }
      it{ subject[:google].should be_nil }
    end
  end
  
  describe "#backlink_trackers" do
    subject{ PageRankr.backlink_trackers }
    
    it{ should include(:alexa) }
    it{ should include(:bing) }
    it{ should include(:google) }
    it{ should include(:yahoo) }
  end
  
  describe "#backlinks" do
    describe "success" do
      subject do
        VCR.use_cassette(:success_backlinks, :record => :new_episodes) do
          PageRankr.backlinks("http://www.google.com")
        end
      end
    
      PageRankr.backlink_trackers.each do |tracker|
        it{ should have_key(tracker) }

        it "#{tracker} should have a value greater than zero" do
          subject[tracker].should be_number > 0
        end
      end
    end
    
    describe "failure" do
      subject do
        VCR.use_cassette(:failure_backlinks, :record => :new_episodes) do
          PageRankr.backlinks("http://please-dont-register-a-site-that-breaks-this-test.com")
        end
      end
      
      PageRankr.backlink_trackers.each do |tracker|
        it{ should have_key(tracker) }

        it "#{tracker} should have a nil value" do
          subject[tracker].should be_nil
        end
      end
    end
  end
  
  describe "#index_trackers" do
    subject{ PageRankr.index_trackers }
    
    it{ should include(:google) }
    it{ should include(:bing) }
  end
  
  describe "#indexes" do
    describe "success" do
      subject do
        VCR.use_cassette(:success_indexes, :record => :new_episodes) do
          PageRankr.indexes("http://www.google.com")
        end
      end
      
      PageRankr.index_trackers.each do |tracker|
        it{ should have_key(tracker) }
        
        it "#{tracker} should have a value greater than zero" do
          subject[tracker].should be_number > 0
        end
      end
    end
    
    describe "failure" do
      subject do
        VCR.use_cassette(:failure_indexes, :record => :new_episodes) do
          PageRankr.indexes("http://please-dont-register-a-site-that-breaks-this-test.com")
        end
      end
      
      PageRankr.index_trackers.each do |tracker|
        it{ should have_key(tracker) }
        
        it "#{tracker} should have a nil value" do
          subject[tracker].should be_nil
        end
      end
    end
  end

  describe "::Site" do
    [nil, '', 'batman.thedarkknight'].each do |value|
      it "should raise an exception when given #{value.inspect}" do
        expect{PageRankr::Site(value)}.to raise_error(PageRankr::DomainInvalid)
      end
    end
  end
end