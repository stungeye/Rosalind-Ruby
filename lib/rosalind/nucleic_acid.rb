module Rosalind
  class NucleicAcid
    def initialize(input_string = "")
      @string = input_string.chomp
      count_bases # Initializes @base_counts hash.
    end
    
    def length
      @string.length
    end
    
    alias_method :size, :length
    
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
    
    def count_U
      @base_counts['U']
    end
    
    def to_base_swapped_string from_base, to_base
      @string.gsub(from_base, to_base)
    end
    
    def ==(other)
      @string == other.to_s
    end
    
    # Zip the array representation of this NucleicAcid with the array rep of another NucleicAcid.
    # Reduce this array of zipped tuples to an integer hamming distance.
    def hamming_distance(other)
      self_array = self.to_a
      other_array = other.to_a
      self_array.zip(other_array).reduce(0) do |hamming, bases|
        hamming += bases[0] == bases[1] ? 0 : 1
      end
    end
    
    # Builds an array of all the indexes where a specific substring (other)
    # can be found within the object's bases. The indexes are one-based, not zero-based.
    # Initially wanted to use the String .scan method, but it couldn't find substrings
    # embedded within substrings. For example, in GATATATGCATATACTT scan could only find
    # ATAT at 1-based position 2 and 10, but not at position 4. 
    def find_substring_indexes(other)
      i = 0
      indexes = []
      final_index_position = self.length - other.length
      
      while (i < final_index_position)
        index = self.to_s.index(other.to_s,i)
        break if index.nil?
        i = index + 1
        indexes << i
      end
      
      indexes
    end
    
    def to_s
      @string
    end
    
    def to_a
      @string.split(//)   
    end
    
    def percentage_GC_content
      100.0 * (count_C + count_G) / length
    end
    
    def percentage_GC_content_string
      "#{percentage_GC_content}%"
    end
    
    protected
    
    def count_bases
      @base_counts = Hash.new(0)
      @string.each_char { |base| @base_counts[base] += 1 }
    end
  end
end