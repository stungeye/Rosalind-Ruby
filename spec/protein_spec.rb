require 'minitest/autorun'
require_relative '../lib/rosalind'

describe Rosalind::Protein do
  before do
    @short_string = Rosalind::Protein.new('MAMAPRTEINSTRING') # One of each base for testing purposes.
  end
  
  describe "when asked for its class" do
    it "must respond with Protein" do
      @short_string.class.must_equal Rosalind::Protein
    end
  end
  
  describe "when initialized with the test string 'MAMAPRTEINSTRING'" do
    it "must respond with the correct symbol counts" do
      @short_string.count_M.must_equal 2
      @short_string.count_A.must_equal 2
      @short_string.count_P.must_equal 1
      @short_string.count_R.must_equal 2
      @short_string.count_T.must_equal 2
      @short_string.count_E.must_equal 1
      @short_string.count_I.must_equal 2
      @short_string.count_N.must_equal 2
      @short_string.count_S.must_equal 1
      @short_string.count_G.must_equal 1
    end
  end

end
