require_relative 'nucleic_acid'

class DNA < NucleicAcid
  
  def ASCII_base_count
    "#{count_A} #{count_C} #{count_G} #{count_T}"
  end
  
  def to_rna
    RNA.new( to_base_swapped_string('T','U') )
  end
  
end
