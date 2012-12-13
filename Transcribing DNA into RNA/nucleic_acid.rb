class NucleicAcid
  def initialize(input_string = "")
    @string = input_string
    @base_counts = Hash.new(0)
    count_bases
  end
  
  def length
    @string.length
  end
  
  def count_A
    @base_counts['A']
  end
  
  def count_C
    @base_counts['C']
  end
  
  def count_G
    @base_counts['G']
  end
  
  def count_T
    @base_counts['T']
  end
  
  def ASCII_ACGT_counts
    "#{count_A} #{count_C} #{count_G} #{count_T}"
  end
  
  protected
  
  def count_bases
    @string.each_char { |base| @base_counts[base] += 1 }
  end
end