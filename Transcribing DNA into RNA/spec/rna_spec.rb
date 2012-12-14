require 'minitest/autorun'
require_relative '../lib/rosalind'

describe RNA do
  before do
    @empty_rna = RNA.new
    @short_rna = RNA.new('ACGU')
    @sample_rna_string = RNA.new('AGCUUUUCAUUCUGACUGCAACGGGCAAUAUGUCUCUGUGUGGAUUAAAAAAAGAGUGUCUGAUAGCAGC')
    @sample_dna_string = DNA.new('AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC')
  end
  
  describe "when asked for its class" do
    it "must response with RNA" do
      @empty_rna.class.must_equal RNA
    end
  end
  
  describe "when initialized with 'rna' sample dataset" do
    it "must generate the correct ASCII count output" do
      @sample_rna_string.ASCII_base_count.must_equal "20 12 17 21"
    end
  end
  
  describe "when given a DNA object" do
    it "must convert to the a RNA object" do
      @rna_string = @sample_dna_string.to_rna
      @rna_string.class.must_equal RNA
    end
    it "must convert to the correct sample RNA object" do
      @rna_string = @sample_dna_string.to_rna
      @rna_string.must_equal @sample_rna_string
    end
  end
end