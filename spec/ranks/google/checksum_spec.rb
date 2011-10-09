require 'spec_helper'

SAMPLES = {
  'RDwuPEHIrgTSfjFwIrNQQWlBe' => '61829755294',
  'EpQgoYSvBcBsgApYnXvimwbUumJeajtPwVpyK' => '6186476753',
  'wNKCeCesYrBWVHOebbHYUXtYKUJsYZ' => '6671095448',
  'WcuHBErnmnlobkoljovgcipTEoxNKNkozMyrBoHumbaIRlDTX' => '63131963413',
  'zmZMVOZeOSAjllPQebawJvTyx' => '62448745255',
  'zIhqWNkSWVDtGyZJNAhXrsxvr' => '63949686801',
  'HUJRIlqBoPiacanILngyPhvvwLYUTzXrLPGfFBXL' => '63415960540',
  'FmaqTt' => '63552779043',
  'bbjjofINMufjVmSDbiYKuEErqjbYYdcrftUieapFlWzxoYsMGz' => '61691333163',
  'ydczxaBUFUtKxKJIxDrPvqxBiaqYPv' => '61407467036',
  'ccYqbRnRDPPDHVMsckdGnbpGAuPbUNIbETxP' => '6977369525',
  'LMmlBvFBXGvMxkjBfNVBLqmaCr' => '62712427129',
  'jjiEggColBhBYwuiePcDpBTQwwlvFzKwmp' => '63273258388',
  'SMdamRDmvkJVeNTebaagEXxTXkSCnZiCkkVhnqHvdSAPtNfyr' => '62208970149',
  'vOmJIIbRUvYjaNjssTuZXgRIOgoL' => '64235838996',
  'BwaSRvqktWSqgEMltozGwmjvxVxVQCSyvWtsmyjwHCOLVUC' => '6420878824',
  'YfgEaPPyBTjouR' => '6458181074',
  'DgheQaizjMialWKddArxjAAabMmqRBecpWEITApW' => '61835654521',
  'aLDGcvrIyQBcULWAfXPUf' => '63461928551',
  'INZIhnvQsNRYBFTxMgVXa' => '62218867354',
  'XUWkScxADSi' => '62385139378',
  'spCHnLtDAsCZsknhvb' => '61820559828',
  'zwMlYkrXxUXAfibWDzGhNZQkfQrUYRTWI' => '61022243780',
  'VQOXivprmVdolPLVwHKOuYvTmioXZXGezRqtckeDn' => '6245734774',
  'HZKigUSAFnrOLYlevkfnUfHfBgLTvlCJf' => '6967063059',
  'AVNOlRWJWaFDDXftjswFgi' => '64112795569',
  'LMIdcsdjebQzLFUNshdANQcIYVYuN' => '645237629',
  'srzhYNeleTqUfZs' => '619038735',
  'PRmyimgSzJxjSkiyAmdVcbSmCupU' => '64211619364',
  'zDFRVUuKvN' => '63247517344',
  'tTAAuluIGwiMKlpomnbFWbLQlhgjhncMIyWtvcJHVWbeoc' => '63897095596',
  'eGwAubHVWzCqHdhZYuPlEkOKjQvPnEztyD' => '63364608090',
  'bHCitHCtfRgUZcdnPMMjeMKIyByCoTbvpQmAh' => '63156276696',
  'xbJKX' => '64254327941',
  'rNXiXkmPFeZcHNNfiAuDnJLC' => '6104612190',
  'wnOb' => '6336004426',
  'bVNaQhWifmkUe' => '63824878933',
  'NpXUdZY' => '6906257454',
  'APJkWZOI' => '61597361583',
  'OBwoI' => '61269006972',
  'WJWBrvLPtPvzYWJZWXDyuRAFVKldUfukd' => '63619607517',
  'yJmQUYAaUflHgOZIRLWTpwlYhrdwOZcvyYmqQYsnRGDmz' => '63256121068',
  'FJDGohessfwGmSBsWAwdCmtiDjabJfAqGxZdDkXXDv' => '6996319496',
  'UwBkNFMXRhAOtEgmHpPYdSIcEINvQPtSoHnBNExlXoeKtMxAgFzB' => '62402896352',
  'BX' => '62877873383',
  'ifcdHujBOWnTwzbNFuBuh' => '61660858736',
  'nmkszzBXQIfK' => '63904972489',
  'wdLFQxGR' => '61749984767',
  'kXxpmTyiLNJfYHlMwxWoMgaAjhIdCQga' => '6263504998',
  'qbYyPjyqIhGxebMRjBGAACzFVoTsQRNwyECQelaGymV' => '61924652799',
  'www.google.com' => '6340563836',
  'https://github.com' => '62404774461',
}

describe PageRankr::Ranks::Google::Checksum do
  describe "#generate" do
    SAMPLES.each do |input, output|
      it "should generate #{output} as a checksum for #{input}" do
        PageRankr::Ranks::Google::Checksum.generate(input).should == output
      end
    end
  end
end