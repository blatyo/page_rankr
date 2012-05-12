require 'spec_helper'

describe PageRankr::Site do
  describe "#scheme" do
    it "should set the scheme to http if no scheme is present" do
      PageRankr::Site("www.google.com").scheme.should == "http"
    end

    it "should use the scheme if it is provided" do
      PageRankr::Site("https://www.google.com").scheme.should == "https"
    end
  end
end