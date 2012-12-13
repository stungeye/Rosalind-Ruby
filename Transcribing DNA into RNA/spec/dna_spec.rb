require 'minitest/autorun'
require_relative '../lib/rosalind'

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
  
  
  describe "when initialized with Rosalind 'dna' sample dataset" do
    it "must generate the correct ASCII count output" do
      @sample_rosalind_dna.ASCII_base_count.must_equal "20 12 17 21"
    end
  end
end