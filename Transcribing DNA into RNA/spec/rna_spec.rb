require 'minitest/autorun'
require_relative '../lib/rosalind'

describe RNA do
  before do
    @empty_rna = RNA.new
    @short_rna = RNA.new('ACGU')
    @sample_rna = RNA.new('AGCUUUUCAUUCUGACUGCAACGGGCAAUAUGUCUCUGUGUGGAUUAAAAAAAGAGUGUCUGAUAGCAGC')
    @sample_dna = DNA.new('AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC')
  end
  
  describe "when asked for its class" do
    it "must response with RNA" do
      @empty_rna.class.must_equal RNA
    end
  end
  
  describe "when initialized with 'rna' sample dataset" do
    it "must generate the correct ASCII count output" do
      @sample_rna.ASCII_base_count.must_equal "20 12 17 21"
    end
  end
  
  describe "when transcribing to DNA" do
    it "must convert to a DNA object" do
      @dna_from_rna = @sample_rna.to_dna
      @dna_from_rna.class.must_equal DNA
    end
    it "must convert to the correct sample DNA object" do
      @dna_from_rna = @sample_rna.to_dna
      @dna_from_rna.must_equal @sample_dna
    end
  end
end