require_relative 'nucleic_acid'

module Rosalind
  class DNA < NucleicAcid
    
    ALLOWED_SYMBOLS = ['G','A','C','T']
    
    def initialize(input_string = "")
      super(input_string, ALLOWED_SYMBOLS)
    end
    
    def ASCII_base_count
      "#{count_A} #{count_C} #{count_G} #{count_T}"
    end
    
    def to_rna
      RNA.new( to_base_swapped_string('T','U') )
    end
    
    def to_reverse_complement
      reverse_string = self.to_s.reverse
      reverse_complement_string = reverse_string.chars.map do |n|
        case n
        when 'A'
          'T'
        when 'T'
          'A'
        when 'C'
          'G'
        when 'G'
          'C'
        end
      end.join
      DNA.new( reverse_complement_string )
    end
    
  end
end