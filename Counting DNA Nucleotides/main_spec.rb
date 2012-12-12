require 'minitest/autorun'
require_relative 'main'

describe DNA do
  before do
    @empty_dna = DNA.new
    @short_dna = DNA.new('ACGT')
  end
  
  describe "when asked for its class" do
    it "must response with DNA" do
      @empty_dna.class.must_equal DNA
    end
  end
  
  describe "when initialized with an empty string" do
    it "must respond with a length of zero" do
      @empty_dna.length.must_equal 0
    end
    
    it "must respond with all base counts as zero" do
      @empty_dna.count_A.must_equal 0
      @empty_dna.count_C.must_equal 0
      @empty_dna.count_G.must_equal 0
      @empty_dna.count_T.must_equal 0
    end
  end
  
  describe "with initialized with 'ACGT'" do
    it "must respond with a length of four" do
      @short_dna.length.must_equal 4
    end
    it "must respond with all base counts as one" do
      @short_dna.count_A.must_equal 1
      @short_dna.count_C.must_equal 1
      @short_dna.count_G.must_equal 1
      @short_dna.count_T.must_equal 1
    end
  end
end
