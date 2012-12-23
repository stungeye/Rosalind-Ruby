require 'minitest/autorun'
require_relative '../lib/rosalind'

describe Rosalind::NucleicAcid do
  before do
    @empty_string = Rosalind::NucleicAcid.new
    @short_string = Rosalind::NucleicAcid.new('ACGTU') # One of each base for testing purposes.
    @sample_dna_string = Rosalind::NucleicAcid.new('AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC')
    @sample_rna_string = Rosalind::NucleicAcid.new('AGCUUUUCAUUCUGACUGCAACGGGCAAUAUGUCUCUGUGUGGAUUAAAAAAAGAGUGUCUGAUAGCAGC')
    @medium_string_1   = Rosalind::NucleicAcid.new('GAGCCTACTAACGGGAT')
    @medium_string_2   = Rosalind::NucleicAcid.new('CATCGTAATGACGGCCT')
  end
  
  describe "when asked for its class" do
    it "must response with NucleicAcid" do
      @empty_string.class.must_equal Rosalind::NucleicAcid
      @short_string.class.must_equal Rosalind::NucleicAcid
      @sample_dna_string.class.must_equal Rosalind::NucleicAcid
      @sample_rna_string.class.must_equal Rosalind::NucleicAcid
    end
  end
  
  describe "when initialized with an empty string" do
    it "must respond with a length of zero" do
      @empty_string.length.must_equal 0
    end
    
    it "must respond with all base counts as zero" do
      @empty_string.count_A.must_equal 0
      @empty_string.count_C.must_equal 0
      @empty_string.count_G.must_equal 0
      @empty_string.count_T.must_equal 0
      @empty_string.count_U.must_equal 0
    end
  end
  
  describe "when initialized with 'ACGTU'" do
    it "must respond with a length of five" do
      @short_string.length.must_equal 5
    end
    it "must respond with all base counts as one" do
      @short_string.count_A.must_equal 1
      @short_string.count_C.must_equal 1
      @short_string.count_G.must_equal 1
      @short_string.count_T.must_equal 1
      @short_string.count_U.must_equal 1
    end
    it "must respond with a GC content of 40% +/- 0.001" do
      @short_string.percentage_GC_content.must_be_within_delta 40, 0.001
    end
    it "must have a hamming distance of zero with itself" do
      copy_string = Rosalind::NucleicAcid.new(@short_string.to_s)
      @short_string.hamming_distance(copy_string).must_equal 0
    end
    it "must have a hamming distance of 4 with it's reverse string" do
      copy_string = Rosalind::NucleicAcid.new(@short_string.to_s.reverse)
      @short_string.hamming_distance(copy_string).must_equal 4
    end
  end
  
  describe "when comapared with another medium lenght NucelicAcid" do
    it "must have the same length as the other" do
      @medium_string_1.length.must_equal @medium_string_2.length
    end
    it "must have a hamming distance of seven" do
      @medium_string_1.hamming_distance(@medium_string_2).must_equal 7
    end
  end
  
  describe "when initialized with 'dna' sample dataset" do
    it "must respond with a length of seventy" do
      @sample_dna_string.length.must_equal 70
    end
    it "must respond with the correct Rosalind sample output" do
      @sample_dna_string.count_A.must_equal 20
      @sample_dna_string.count_C.must_equal 12
      @sample_dna_string.count_G.must_equal 17
      @sample_dna_string.count_T.must_equal 21
    end
    it "must respond with a GC content of nearly 41.428571%"  do
      @sample_dna_string.percentage_GC_content.must_be_within_delta 41.42857142857143, 0.001
    end
  end

  describe "when initialized with 'rna' sample dataset" do
    it "must respond with a length of seventy" do
      @sample_rna_string.length.must_equal 70
    end
    it "must respond with the correct Rosalind sample output" do
      @sample_rna_string.count_A.must_equal 20
      @sample_rna_string.count_C.must_equal 12
      @sample_rna_string.count_G.must_equal 17
      @sample_rna_string.count_U.must_equal 21
    end
    it "must respond with a GC content of nearly 41.428571%"  do
      @sample_rna_string.percentage_GC_content.must_be_within_delta 41.42857142857143, 0.001
    end
  end
end
