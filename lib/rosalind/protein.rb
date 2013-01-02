module Rosalind
  class Protein < Sequence
    # All characters in the alphabet allowed except for B, J, O, U, X and Z.
    ALLOWED_SYMBOLS = ('A'..'Z').select { |s| !%w{B J O U X Z}.include?(s) }
    
    def initialize(input_string = "", allowed_symbols = ALLOWED_SYMBOLS)
      super(input_string, allowed_symbols)
    end
    
  end
end
