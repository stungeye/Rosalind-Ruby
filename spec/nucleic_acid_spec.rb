require 'minitest/autorun'
require_relative '../lib/rosalind'

describe Rosalind::NucleicAcid do
  before do
    @short_string = Rosalind::NucleicAcid.new('ACGTU') # One of each base for testing purposes.
    @sample_dna_string = Rosalind::NucleicAcid.new('AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC')
    @sample_rna_string = Rosalind::NucleicAcid.new('AGCUUUUCAUUCUGACUGCAACGGGCAAUAUGUCUCUGUGUGGAUUAAAAAAAGAGUGUCUGAUAGCAGC')
    @medium_string_1   = Rosalind::NucleicAcid.new('GAGCCTACTAACGGGAT')
    @medium_string_2   = Rosalind::NucleicAcid.new('CATCGTAATGACGGCCT')
    @medium_string_3   = Rosalind::NucleicAcid.new('GATATATGCATATACTT')
  end
  
  describe "when asked for its class" do
    it "must response with NucleicAcid" do
      @short_string.class.must_equal Rosalind::NucleicAcid
      @sample_dna_string.class.must_equal Rosalind::NucleicAcid
      @sample_rna_string.class.must_equal Rosalind::NucleicAcid
      @medium_string_1.class.must_equal Rosalind::NucleicAcid
      @medium_string_2.class.must_equal Rosalind::NucleicAcid
      @medium_string_3.class.must_equal Rosalind::NucleicAcid
    end
  end
  
  describe "when initialized with 'ACGTU'" do
    it "must respond with a GC content of 40% +/- 0.001" do
      @short_string.percentage_GC_content.must_be_within_delta 40, 0.001
    end
  end
  
  describe "when initialized with 'dna' sample datasets" do
    it "must respond with a GC content of nearly 41.428571%"  do
      @sample_dna_string.percentage_GC_content.must_be_within_delta 41.42857142857143, 0.001
    end
    it "must respond with the correct Rosalind sample output" do
      @sample_dna_string.count_A.must_equal 20
      @sample_dna_string.count_C.must_equal 12
      @sample_dna_string.count_G.must_equal 17
      @sample_dna_string.count_T.must_equal 21
    end
  end

  describe "when initialized with 'rna' sample dataset" do
    it "must respond with a GC content of nearly 41.428571%"  do
      @sample_rna_string.percentage_GC_content.must_be_within_delta 41.42857142857143, 0.001
    end
    it "must respond with the correct Rosalind sample output" do
      @sample_rna_string.count_A.must_equal 20
      @sample_rna_string.count_C.must_equal 12
      @sample_rna_string.count_G.must_equal 17
      @sample_rna_string.count_U.must_equal 21
    end
  end
end
