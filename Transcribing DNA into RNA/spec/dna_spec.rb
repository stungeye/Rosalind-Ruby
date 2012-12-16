require 'minitest/autorun'
require_relative '../lib/rosalind'

describe DNA do
  before do
    @empty_dna = DNA.new
    @short_dna = DNA.new('ACGT')
    @sample_rna = RNA.new('AGCUUUUCAUUCUGACUGCAACGGGCAAUAUGUCUCUGUGUGGAUUAAAAAAAGAGUGUCUGAUAGCAGC')
    @sample_dna = DNA.new('AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC')
  end
  
  describe "when asked for its class" do
    it "must response with DNA" do
      @empty_dna.class.must_equal DNA
    end
  end
  
  describe "when initialized with Rosalind 'dna' sample dataset" do
    it "must generate the correct ASCII count output" do
      @sample_dna.ASCII_base_count.must_equal "20 12 17 21"
    end
  end
  
  describe "when transcribing to RNA" do
    it "must be able to convert to a RNA object" do
      @rna_from_dna = @sample_dna.to_rna
      @rna_from_dna.class.must_equal RNA
    end
    it "must convert to RNA correctly" do
      @rna_from_dna = @sample_dna.to_rna
      @rna_from_dna.must_equal @sample_rna
    end
    it "must be able to convert back to original DNA" do
      @sample_dna.to_rna.to_dna.must_equal @sample_dna
    end
  end
end