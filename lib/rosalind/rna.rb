require_relative 'nucleic_acid'

module Rosalind
  class RNA < NucleicAcid
     ALLOWED_SYMBOLS = ['G','A','C','U']
    
    def initialize(input_string = "")
      super(input_string, ALLOWED_SYMBOLS)
    end
    
    def ASCII_base_count
      "#{count_A} #{count_C} #{count_G} #{count_U}"
    end
    
    def to_dna
      DNA.new( to_base_swapped_string('U','T') )
    end
  end
end