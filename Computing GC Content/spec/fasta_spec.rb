require 'minitest/autorun'
require_relative '../lib/rosalind'

describe Rosalind::Fasta do
  before do
    @sample_fasta_1 = Rosalind::Fasta.new
  end
  
  describe "when asked for its class" do
    it "must response with Fasta" do
      @sample_fasta_1.class.must_equal Rosalind::Fasta
    end
  end
end