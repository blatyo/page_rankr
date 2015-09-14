require 'spec_helper'

describe PageRankr::Ranks::MozRank do
  describe '#run' do
    let(:tracker){described_class.new(site)}
    subject(:result){tracker.run}

    context 'with match', :vcr do
      let(:site){'http://www.google.com'}

      it{is_expected.to be_number > 0}
    end

    context 'with no match', :vcr do
      let(:site){'http://please-dont-register-a-site-that-breaks-this-test.com'}

      # always returns a result
      it{is_expected.to eq(0)}
    end
  end
end
