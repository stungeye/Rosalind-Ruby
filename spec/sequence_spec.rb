require 'minitest/autorun'
require_relative '../lib/rosalind'

describe Rosalind::Sequence do
  before do
    @empty_string = Rosalind::Sequence.new
    @short_string = Rosalind::Sequence.new('ACGTU') # One of each base for testing purposes.
    @sample_dna_string = Rosalind::Sequence.new('AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC')
    @sample_rna_string = Rosalind::Sequence.new('AGCUUUUCAUUCUGACUGCAACGGGCAAUAUGUCUCUGUGUGGAUUAAAAAAAGAGUGUCUGAUAGCAGC')
    @medium_string_1   = Rosalind::Sequence.new('GAGCCTACTAACGGGAT')
    @medium_string_2   = Rosalind::Sequence.new('CATCGTAATGACGGCCT')
    @medium_string_3   = Rosalind::Sequence.new('GATATATGCATATACTT')
  end
  
  describe "when asked for its class" do
    it "must response with Sequence" do
      @empty_string.class.must_equal Rosalind::Sequence
      @short_string.class.must_equal Rosalind::Sequence
    end
  end
  
  describe "when initialized with an empty string" do
    it "must respond with a length of zero" do
      @empty_string.length.must_equal 0
    end
    it "must respond with all symbol counts as zero" do
      ('A'..'Z').each do |s|
        @empty_string.send("count_#{s}").must_equal 0
      end
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
    it "must have a hamming distance of zero with itself" do
      copy_string = Rosalind::Sequence.new(@short_string.to_s)
      @short_string.hamming_distance(copy_string).must_equal 0
    end
    it "must have a hamming distance of 4 with it's reverse string" do
      copy_string = Rosalind::Sequence.new(@short_string.to_s.reverse)
      @short_string.hamming_distance(copy_string).must_equal 4
    end
  end
  
  describe "when comapared with another medium length Sequence" do
    it "must have the same length as the other" do
      @medium_string_1.length.must_equal @medium_string_2.length
    end
    it "must have a hamming distance of seven" do
      @medium_string_1.hamming_distance(@medium_string_2).must_equal 7
    end
  end
  
  describe "when initialized with 'dna' sample datasets" do
    it "must respond with a length of seventy" do
      @sample_dna_string.length.must_equal 70
    end
    it "must show that a specific substring doesn't exist within its bases" do
      indexes = @medium_string_3.find_substring_indexes(@short_string)
      indexes.count.must_equal 0
      indexes.must_equal []
    end
    it "must find all indexes of a specific substring within its bases" do
      indexes = @medium_string_3.find_substring_indexes(Rosalind::Sequence.new('ATAT'))
      indexes.count.must_equal 3
      indexes.must_equal [2, 4, 10]
    end
  end

  describe "when initialized with 'rna' sample dataset" do
    it "must respond with a length of seventy" do
      @sample_rna_string.length.must_equal 70
    end
  end
  
  describe "when searching for the longest common substring" do
    it "must find the correct substring amongst three sequences" do
      longest_common_substring = Rosalind::Sequence.longest_common_substring([@medium_string_1, @medium_string_2, @medium_string_3])
      longest_common_substring.must_equal Rosalind::Sequence.new('GA')
    end
  end
end
