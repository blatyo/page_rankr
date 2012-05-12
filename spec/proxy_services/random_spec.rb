require 'spec_helper'

describe PageRankr::ProxyServices::Random do
  let(:proxies) do
    [
      "user:password@192.168.1.1:50501",
      "bob:smith@127.0.0.1:3000"
    ]
  end
  let(:site){PageRankr::Site("http://www.google.com")}
  let(:class_name){"PageRankr::Ranks::Google"}
  subject{PageRankr::ProxyServices::Random.new(proxies)}

  it{should respond_to(:proxy).with(2).arguments}

  it "should return a proxy from the list of proxies" do
    10.times do
      proxies.should include(subject.proxy(class_name, site))
    end
  end
end