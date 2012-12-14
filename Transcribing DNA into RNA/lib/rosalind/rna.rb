require_relative 'nucleic_acid'

class RNA < NucleicAcid
  
  def ASCII_base_count
    "#{count_A} #{count_C} #{count_G} #{count_U}"
  end
  
  def to_dna
  end
  
end
