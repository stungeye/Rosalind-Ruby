require_relative 'nucleic_acid'

module Rosalind
  class RNA < NucleicAcid
    ALLOWED_SYMBOLS = ['G','A','C','U']
    CODONS_TO_AMINO_ACIDS = { 'UUU' => 'F',
                              'CUU' => 'L',
                              'AUU' => 'I',
                              'GUU' => 'V',
                              'UUC' => 'F',
                              'CUC' => 'L',
                              'AUC' => 'I',
                              'GUC' => 'V',
                              'UUA' => 'L',
                              'CUA' => 'L',
                              'AUA' => 'I',
                              'GUA' => 'V',
                              'UUG' => 'L',
                              'CUG' => 'L',
                              'AUG' => 'M',
                              'GUG' => 'V',
                              'UCU' => 'S',
                              'CCU' => 'P',
                              'ACU' => 'T',
                              'GCU' => 'A',
                              'UCC' => 'S',
                              'CCC' => 'P',
                              'ACC' => 'T',
                              'GCC' => 'A',
                              'UCA' => 'S',
                              'CCA' => 'P',
                              'ACA' => 'T',
                              'GCA' => 'A',
                              'UCG' => 'S',
                              'CCG' => 'P',
                              'ACG' => 'T',
                              'GCG' => 'A',
                              'UAU' => 'Y',
                              'CAU' => 'H',
                              'AAU' => 'N',
                              'GAU' => 'D',
                              'UAC' => 'Y',
                              'CAC' => 'H',
                              'AAC' => 'N',
                              'GAC' => 'D',
                              'UAA' => :stop,
                              'CAA' => 'Q',
                              'AAA' => 'K',
                              'GAA' => 'E',
                              'UAG' => :stop,
                              'CAG' => 'Q',
                              'AAG' => 'K',
                              'GAG' => 'E',
                              'UGU' => 'C',
                              'CGU' => 'R',
                              'AGU' => 'S',
                              'GGU' => 'G',
                              'UGC' => 'C',
                              'CGC' => 'R',
                              'AGC' => 'S',
                              'GGC' => 'G',
                              'UGA' => :stop,
                              'CGA' => 'R',
                              'AGA' => 'R',
                              'GGA' => 'G',
                              'UGG' => 'W',
                              'CGG' => 'R',
                              'AGG' => 'R',
                              'GGG' => 'G'}

    def initialize(input_string = "")
      super(input_string, ALLOWED_SYMBOLS)
    end
    
    def ASCII_base_count
      "#{count_A} #{count_C} #{count_G} #{count_U}"
    end
    
    def to_dna
      DNA.new( to_base_swapped_string('U','T') )
    end
    
    def to_protein
      protein_string = ''
      self.to_s.scan(/.{1,3}/m).each do |codon|
        amino_acid = CODONS_TO_AMINO_ACIDS[codon]
        break if amino_acid == :stop
        protein_string << amino_acid
      end
      Protein.new(protein_string)
    end
  end
end