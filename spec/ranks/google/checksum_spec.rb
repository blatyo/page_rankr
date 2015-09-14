require 'spec_helper'

SAMPLES = {
  'RDwuPEHIrgTSfjFwIrNQQWlBe'                            => '62055409506',
  'EpQgoYSvBcBsgApYnXvimwbUumJeajtPwVpyK'                => '63696758529',
  'wNKCeCesYrBWVHOebbHYUXtYKUJsYZ'                       => '62499718143',
  'WcuHBErnmnlobkoljovgcipTEoxNKNkozMyrBoHumbaIRlDTX'    => '62990136296',
  'zmZMVOZeOSAjllPQebawJvTyx'                            => '62600475104',
  'zIhqWNkSWVDtGyZJNAhXrsxvr'                            => '61779137032',
  'HUJRIlqBoPiacanILngyPhvvwLYUTzXrLPGfFBXL'             => '63164171011',
  'FmaqTt'                                               => '63696846590',
  'bbjjofINMufjVmSDbiYKuEErqjbYYdcrftUieapFlWzxoYsMGz'   => '6428000023',
  'ydczxaBUFUtKxKJIxDrPvqxBiaqYPv'                       => '6759338533',
  'ccYqbRnRDPPDHVMsckdGnbpGAuPbUNIbETxP'                 => '63618603088',
  'LMmlBvFBXGvMxkjBfNVBLqmaCr'                           => '62431570439',
  'jjiEggColBhBYwuiePcDpBTQwwlvFzKwmp'                   => '62648705831',
  'SMdamRDmvkJVeNTebaagEXxTXkSCnZiCkkVhnqHvdSAPtNfyr'    => '6878476314',
  'vOmJIIbRUvYjaNjssTuZXgRIOgoL'                         => '62170208114',
  'BwaSRvqktWSqgEMltozGwmjvxVxVQCSyvWtsmyjwHCOLVUC'      => '64152263835',
  'YfgEaPPyBTjouR'                                       => '61911140243',
  'DgheQaizjMialWKddArxjAAabMmqRBecpWEITApW'             => '6192924161',
  'aLDGcvrIyQBcULWAfXPUf'                                => '64117571081',
  'INZIhnvQsNRYBFTxMgVXa'                                => '6555275853',
  'XUWkScxADSi'                                          => '6350572650',
  'spCHnLtDAsCZsknhvb'                                   => '61624563975',
  'zwMlYkrXxUXAfibWDzGhNZQkfQrUYRTWI'                    => '61602088851',
  'VQOXivprmVdolPLVwHKOuYvTmioXZXGezRqtckeDn'            => '62545550187',
  'HZKigUSAFnrOLYlevkfnUfHfBgLTvlCJf'                    => '6769537725',
  'AVNOlRWJWaFDDXftjswFgi'                               => '63208473934',
  'LMIdcsdjebQzLFUNshdANQcIYVYuN'                        => '64007570819',
  'srzhYNeleTqUfZs'                                      => '62437029261',
  'PRmyimgSzJxjSkiyAmdVcbSmCupU'                         => '61858587900',
  'zDFRVUuKvN'                                           => '63966306432',
  'tTAAuluIGwiMKlpomnbFWbLQlhgjhncMIyWtvcJHVWbeoc'       => '63823152059',
  'eGwAubHVWzCqHdhZYuPlEkOKjQvPnEztyD'                   => '6495782915',
  'bHCitHCtfRgUZcdnPMMjeMKIyByCoTbvpQmAh'                => '6875882828',
  'xbJKX'                                                => '61447129925',
  'rNXiXkmPFeZcHNNfiAuDnJLC'                             => '6411099889',
  'wnOb'                                                 => '6466687088',
  'bVNaQhWifmkUe'                                        => '61080905374',
  'NpXUdZY'                                              => '6271405864',
  'APJkWZOI'                                             => '63718750842',
  'OBwoI'                                                => '64211141471',
  'WJWBrvLPtPvzYWJZWXDyuRAFVKldUfukd'                    => '62941406460',
  'yJmQUYAaUflHgOZIRLWTpwlYhrdwOZcvyYmqQYsnRGDmz'        => '62977926381',
  'FJDGohessfwGmSBsWAwdCmtiDjabJfAqGxZdDkXXDv'           => '62678453226',
  'UwBkNFMXRhAOtEgmHpPYdSIcEINvQPtSoHnBNExlXoeKtMxAgFzB' => '63584282177',
  'BX'                                                   => '6816754104',
  'ifcdHujBOWnTwzbNFuBuh'                                => '6150630468',
  'nmkszzBXQIfK'                                         => '63370482677',
  'wdLFQxGR'                                             => '6615323',
  'kXxpmTyiLNJfYHlMwxWoMgaAjhIdCQga'                     => '6539671864',
  'qbYyPjyqIhGxebMRjBGAACzFVoTsQRNwyECQelaGymV'          => '61636842386',
  'www.google.com'                                       => '63801972318',
  'https://github.com'                                   => '61980590130',
}


describe PageRankr::Ranks::Google::Checksum do
  describe "#generate" do
    SAMPLES.each do |input, output|
      it "should generate #{output} as a checksum for #{input}" do
        expect(PageRankr::Ranks::Google::Checksum.generate(input)).to eq(output)
      end
    end
  end
end
