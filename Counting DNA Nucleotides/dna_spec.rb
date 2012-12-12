require 'minitest/autorun'
require_relative 'main'

describe DNA do
  before do
    @empty_dna = DNA.new
    @short_dna = DNA.new('ACGT')
    @sample_rosalind_dna = DNA.new('AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC')
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
  
  describe "when initialized with 'ACGT'" do
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
  
  describe "when initialized with Rosalind sample dataset" do
    it "must respond with a length of seventy" do
      @sample_rosalind_dna.length.must_equal 70
    end
    it "must respond with the correct Rosalind sample output" do
      @sample_rosalind_dna.count_A.must_equal 20
      @sample_rosalind_dna.count_C.must_equal 12
      @sample_rosalind_dna.count_G.must_equal 17
      @sample_rosalind_dna.count_T.must_equal 21
    end
    it "must generate the correct ASCII count output" do
      @sample_rosalind_dna.ASCII_ACGT_counts.must_equal "20 12 17 21"
    end
  end
end
