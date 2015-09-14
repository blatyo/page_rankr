require 'spec_helper'

describe PageRankr::Backlinks::Bing do
  describe '#run' do
    let(:tracker){described_class.new(site)}
    subject(:result){tracker.run}

    context 'with match', :vcr do
      let(:site){'http://www.google.com'}

      it{is_expected.to be_number > 0}
    end

    context 'with no match', :vcr do
      let(:site){'http://please-dont-register-a-site-that-breaks-this-test.com'}

      # currently matches suggested results
      it{is_expected.to be_number < 2}
    end
  end
end
