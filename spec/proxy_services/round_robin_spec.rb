require 'spec_helper'

describe PageRankr::ProxyServices::RoundRobin do
  let(:proxies) do
    [
      "user:password@192.168.1.1:50501",
      "bob:smith@127.0.0.1:3000"
    ]
  end
  let(:site){PageRankr::Site("http://www.google.com")}
  let(:class_name){"PageRankr::Ranks::Google"}
  subject{PageRankr::ProxyServices::RoundRobin.new(proxies)}

  it{should respond_to(:proxy).with(2).arguments}

  it "should return the first proxy on the first call" do
    subject.proxy(class_name, site).should == proxies.first
  end

  it "should return the second proxy on the second call" do
    subject.proxy(class_name, site)
    subject.proxy(class_name, site).should == proxies.last
  end

  it "should return the first proxy on the third call" do
    subject.proxy(class_name, site)
    subject.proxy(class_name, site)
    subject.proxy(class_name, site).should == proxies.first
  end
end