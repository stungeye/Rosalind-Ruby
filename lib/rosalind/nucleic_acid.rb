module Rosalind
  class NucleicAcid < Sequence
    
    ALLOWED_SYMBOLS = ['G','A','T','C','U']
    
    def initialize(input_string = "", allowed_symbols = ALLOWED_SYMBOLS)
      super(input_string, allowed_symbols)
    end
    
    def to_base_swapped_string from_base, to_base
      @string.gsub(from_base, to_base)
    end
    
    def percentage_GC_content
      100.0 * (count_C + count_G) / length
    end
    
    def percentage_GC_content_string
      "#{percentage_GC_content}%"
    end
    
  end
end