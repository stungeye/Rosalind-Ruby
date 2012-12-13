class NucleicAcid
  def initialize(input_string = "")
    @string = input_string
    count_bases # Initializes @base_counts hash.
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
  
  protected
  
  def count_bases
    @base_counts = Hash.new(0)
    @string.each_char { |base| @base_counts[base] += 1 }
  end
end