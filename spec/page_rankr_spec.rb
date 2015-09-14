require 'spec_helper'

describe PageRankr do
  describe "#rank_trackers" do
    subject{ PageRankr.rank_trackers }

    it{ is_expected.to include(:alexa_us) }
    it{ is_expected.to include(:alexa_global) }
    it{ is_expected.to include(:google) }
    it{ is_expected.to include(:moz_rank) }
  end

  describe "#backlink_trackers" do
    subject{ PageRankr.backlink_trackers }

    it{ is_expected.to include(:bing) }
    it{ is_expected.to include(:google) }
    it{ is_expected.to include(:yahoo) }
  end

  describe "#index_trackers" do
    subject{ PageRankr.index_trackers }

    it{ is_expected.to include(:google) }
    it{ is_expected.to include(:bing) }
  end

  describe "::Site" do
    [nil, '', 'batman.thedarkknight'].each do |value|
      it "raises an exception when given #{value.inspect}" do
        expect{PageRankr::Site(value)}.to raise_error(PageRankr::DomainInvalid)
      end
    end
  end
end
