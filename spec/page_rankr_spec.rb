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
    
    it{ should include(:alexa_us) }
    it{ should include(:alexa_global) }
    it{ should include(:compete) }
    it{ should include(:google) }
  end

  describe "#ranks" do
    describe "success" do
      subject{ PageRankr.ranks("www.google.com") }
  
      it{ should have_key(:alexa_us) }
      it{ should have_key(:alexa_global) }
      it{ should have_key(:google) }
      it{ should have_key(:compete) }
    
      it{ subject[:alexa_us].should >= 1 }
      it{ subject[:alexa_global].should >= 1 }
      it{ subject[:compete].should >= 1 }
      it{ subject[:google].should be_in(0..10) }
    end
    
    describe "failure" do
      subject{ PageRankr.ranks("please-dont-register-a-site-that-breaks-this-test.com") }
      
      it{ should have_key(:alexa_us) }
      it{ should have_key(:alexa_global) }
      it{ should have_key(:google) }
      it{ should have_key(:compete) }
    
      it{ subject[:alexa_us].should == 0 }
      it{ subject[:alexa_global].should == 0 }
      it{ subject[:compete].should == 0 }
      it{ subject[:google].should == -1 }
    end
  end
  
  describe "#backlink_trackers" do
    subject{ PageRankr.backlink_trackers }
    
    it{ should include(:alexa) }
    it{ should include(:all_the_web) }
    it{ should include(:altavista) }
    it{ should include(:bing) }
    it{ should include(:google) }
    it{ should include(:yahoo) }
  end
  
  describe "#backlinks" do
    describe "success" do
      subject{ PageRankr.backlinks("www.google.com") }
    
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
  
  describe "#index_trackers" do
    subject{ PageRankr.index_trackers }
    
    it{ should include(:google) }
    it{ should include(:bing) }
  end
  
  describe "#indexes" do
    describe "success" do
      subject{ PageRankr.indexes("www.google.com") }
      
      PageRankr.index_trackers.each do |tracker|
        it{ should have_key(tracker) }
        it{ subject[tracker].should >= 0 }
      end
    end
    
    describe "failure" do
      subject{ PageRankr.indexes("please-dont-register-a-site-that-breaks-this-test.com") }
      
      PageRankr.index_trackers.each do |tracker|
        it{ should have_key(tracker) }
        it{ subject[tracker].should == 0 }
      end
    end
  end
end