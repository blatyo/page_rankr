require 'spec_helper'

describe PageRankr do
  describe "#ranks" do
    # Alexa may sometimes return a result for the incorrect site and thus it is necessary to check if
    # the results returned are for the site we want.
    #
    # For example, slocourts.net returns results for ca.gov, presumably because www.slocourts.ca.gov redirects
    # to slocourts.net. Clearly something is wrong with how Alexa handles this case and so in the event this
    # happens we treat the results as if there were no results.
    describe "when Alexa returns results for the incorrect site" do
      subject do
        VCR.use_cassette(:alexa_ranks_edge_case_1) do
          PageRankr.ranks("http://slocourts.net", :alexa_us, :alexa_global)
        end
      end
      
      it{ should have_key(:alexa_us) }
      it{ should have_key(:alexa_global) }
      
      it{ subject[:alexa_us].should be_nil }
      it{ subject[:alexa_global].should be_nil }
    end
  end
end