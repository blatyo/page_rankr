require 'spec_helper'

RSpec::Matchers.define :be_in do |expected|
  match do |actual|
    expected === actual
  end
  
  failure_message_for_should do |actual|
    "expected that #{actual} would be in #{expected}"
  end
end

describe PageRankr do
  describe "#rank_trackers" do
    subject{ PageRankr.rank_trackers }
    
    it{ should include(:alexa) }
    it{ should include(:google) }
  end

  describe "#ranks" do
    describe "success" do
      subject{ PageRankr.ranks("google.com") }
  
      it{ should have_key(:alexa) }
      it{ should have_key(:google) }
    
      let(:alexa_rank) { subject[:alexa] }
      it{ alexa_rank.should have_key(:us) }
      it{ alexa_rank.should have_key(:global) }
    
      let(:alexa_us_rank) { alexa_rank[:us] }
      it{ alexa_us_rank.should >= 1 }
      let(:alexa_global_rank) { alexa_rank[:global] }
      it{ alexa_global_rank.should >= 1 }
    
      let(:google_rank) { subject[:google] }
      it{ google_rank.should be_in(0..10)}
    end
    
    describe "failure" do
      subject{ PageRankr.ranks("please-dont-register-a-site-that-breaks-this-test.com") }
      
      it{ should have_key(:alexa) }
      it{ should have_key(:google) }
      
      let(:alexa_rank) { subject[:alexa] }
      it{ alexa_rank.should have_key(:us) }
      it{ alexa_rank.should have_key(:global) }
    
      let(:alexa_us_rank) { alexa_rank[:us] }
      it{ alexa_us_rank.should == 0 }
      let(:alexa_global_rank) { alexa_rank[:global] }
      it{ alexa_global_rank.should == 0 }
    
      let(:google_rank) { subject[:google] }
      it{ google_rank.should == -1 }
    end
  end
  
  describe "#backlink_trackers" do
    subject{ PageRankr.backlink_trackers }
    
    it{ should include(:alexa) }
    it{ should include(:alltheweb) }
    it{ should include(:altavista) }
    it{ should include(:bing) }
    it{ should include(:google) }
    it{ should include(:yahoo) }
  end
  
  describe "#backlinks" do
    describe "success" do
      subject{ PageRankr.backlinks("google.com") }
    
      PageRankr.backlink_trackers.each do |tracker|
        it{ should have_key(tracker) }
        it{ subject[tracker].should >= 0 }
      end
    end
    
    describe "failure" do
      subject{ PageRankr.backlinks("please-dont-register-a-site-that-breaks-this-test.com") }
      
      PageRankr.backlink_trackers.each do |tracker|
        it{ should have_key(tracker) }
        it{ subject[tracker].should == 0 }
      end
    end
  end
end