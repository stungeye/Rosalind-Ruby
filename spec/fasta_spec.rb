require 'minitest/autorun'
require_relative '../lib/rosalind'

describe Rosalind::Fasta do
  before do
    @empty_fasta = Rosalind::Fasta.new("")
    fasta_sample_data_1 = ">Rosalind_6404\nCCTGCGGAAGATCGGCACTAGAATAGCCAGAACCGTTTCTCTGAGGCTTCCGGCCTTCCC\nTCCCACTAATAATTCTGAGG\n>Rosalind_5959\nCCATCGGTAGCGCATCCTTAGTCCAATTAAGTCCCTATCCAGGCGCTCCGCCGAAGGTCT\nATATCCATTTGTCAGCAGACACGC\n>Rosalind_0808\nCCACCCTCGTGGTATGGCTAGGCATTCAGGAACCGGAGAACGCTTCAGACCAGCCCGGAC\nTGGGAACCTGCGGGCAGTAGGTGGAAT"
    @fasta_sample = Rosalind::Fasta.new(fasta_sample_data_1)
  end
  
  describe "when asked for its class" do
    it "must response with Fasta" do
      @empty_fasta.class.must_equal Rosalind::Fasta
      @fasta_sample.class.must_equal Rosalind::Fasta
    end
  end
  
  describe "when initialized with an empty string" do
    it "must load no strings" do
      @empty_fasta.length.must_equal 0
    end
  end
  
  describe "when initialized with specific sample data" do
    it "must load three strings" do
      @fasta_sample.length.must_equal 3
    end
    it "must include the record labels" do
      @fasta_sample.has_key?('Rosalind_6404').must_equal true
      @fasta_sample.has_key?('Rosalind_5959').must_equal true
      @fasta_sample.has_key?('Rosalind_0808').must_equal true
    end
  end
  
end