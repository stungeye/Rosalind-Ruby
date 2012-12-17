require_relative 'nucleic_acid'

class RNA < NucleicAcid
  
  def ASCII_base_count
    "#{count_A} #{count_C} #{count_G} #{count_U}"
  end
  
  def to_dna
    DNA.new( to_base_swapped_string('U','T') )
  end
  
end
