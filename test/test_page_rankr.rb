require 'helper'

class TestPageRankr < Test::Unit::TestCase
  
  context "indexes" do
    setup do
      @index = PageRankr.indexes("google.com")
    end
    
    should "respond with google and bing indexes" do
      assert @index.has_key?(:google)
      assert @index.has_key?(:bing)
    end
    
    should "contain google index" do
      assert_kind_of(Fixnum, @index[:google])
    end
    
    should "contain bing index" do
      assert_kind_of(Fixnum, @index[:bing])
    end    
  end
  
  context "ranks" do
    setup do
      @ranks = PageRankr.ranks("google.com")
    end
    
    should "respond with compete rank" do
      assert @ranks.has_key?(:compete)
    end
    
    should "contain compete rank" do
      assert_kind_of(Fixnum, @ranks[:compete])
    end

  end
     
end