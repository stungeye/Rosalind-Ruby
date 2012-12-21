require 'minitest/autorun'
require_relative '../lib/rosalind'

describe Rosalind::RNA do
  before do
    @empty_rna = Rosalind::RNA.new
    @short_rna = Rosalind::RNA.new('ACGU')
    @sample_rna = Rosalind::RNA.new('AGCUUUUCAUUCUGACUGCAACGGGCAAUAUGUCUCUGUGUGGAUUAAAAAAAGAGUGUCUGAUAGCAGC')
    @sample_dna = Rosalind::DNA.new('AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC')
  end
  
  describe "when asked for its class" do
    it "must response with RNA" do
      @empty_rna.class.must_equal Rosalind::RNA
    end
  end
  
  describe "when initialized with 'rna' sample dataset" do
    it "must generate the correct ASCII count output" do
      @sample_rna.ASCII_base_count.must_equal "20 12 17 21"
    end
  end
  
  describe "when transcribing to DNA" do
    it "must be able to convert to a DNA object" do
      @dna_from_rna = @sample_rna.to_dna
      @dna_from_rna.class.must_equal Rosalind::DNA
    end
    it "must convert to DNA correctly" do
      @dna_from_rna = @sample_rna.to_dna
      @dna_from_rna.must_equal @sample_dna
    end
    it "must be able to convert back to original RNA" do
      @sample_rna.to_dna.to_rna.must_equal @sample_rna
    end
  end
end