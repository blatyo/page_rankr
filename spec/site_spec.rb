require 'spec_helper'

describe PageRankr::Site do
  describe "#scheme" do
    it "should set the scheme to http if no scheme is present" do
      expect(PageRankr::Site("www.google.com").scheme).to eq("http")
    end

    it "should use the scheme if it is provided" do
      expect(PageRankr::Site("https://www.google.com").scheme).to eq("https")
    end
  end
end
