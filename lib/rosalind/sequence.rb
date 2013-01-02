module Rosalind
  class Sequence
    def initialize(input_string = "", allowed_symbols = ('A'..'Z'))
      @string = input_string.chomp
      count_sequence_symbols # Initializes @symbol_counts hash.
      
      # Defines the count_A, count_B, count_C, etc methods
      # Depending on the type of sequence different sets of allowed symbols
      # will be defined.
      allowed_symbols.each do |s|
        self.class.send(:define_method, "count_#{s}", -> { @symbol_counts[s] })
      end
    end
    
    def length
      @string.length
    end
    
    def include? substring
      if substring.class == String
        @string.include? substring
      elsif substring.is_a? Sequence
        @string.include? substring.to_s
      end
    end
    
    alias_method :size, :length
    
    def ==(other)
      @string == other.to_s
    end
    
    def [](start_index, end_index)
      self.class.new( @string[start_index,end_index] )
    end
    
    def to_s
      @string
    end
    
    def to_a
      @string.split(//)   
    end
    
    # Zip the array representation of this NucleicAcid with the array rep of another NucleicAcid.
    # Reduce this array of zipped tuples to an integer hamming distance.
    def hamming_distance(other)
      self_array = self.to_a
      other_array = other.to_a
      self_array.zip(other_array).reduce(0) do |hamming, symbols|
        hamming += symbols[0] == symbols[1] ? 0 : 1
      end
    end
    
    # Builds an array of all the indexes where a specific substring (other)
    # can be found within the object's bases. The indexes are one-based, not zero-based.
    # Initially wanted to use the String .scan method, but it couldn't find substrings
    # embedded within substrings. For example, in GATATATGCATATACTT scan could only find
    # ATAT at 1-based position 2 and 10, but not at position 4. 
    def find_substring_indexes(other)
      Array.new.tap do |indexes|
        final_index_position = self.length - other.length
        i = 0
        while (i < final_index_position)
          index = self.to_s.index(other.to_s,i)
          break if index.nil?
          i = index + 1
          indexes << i
        end
      end
    end
    
  
  # CLASS METHODS
  
  # Finds the longest common substring from an array of sequences.
  # It is assumed that all the sequences are of the same class.
  # This assumption allows us to return a sub-sequence of the same class as
  # the sequences we searched through.
  def self.longest_common_substring(sequences)
    shortest = sequences.min_by(&:length)
    maxlen = shortest.length
    maxlen.downto(1) do |len|
      0.upto(maxlen - len) do |start|
        substr = shortest.to_s[start,len]
        return shortest.class.new(substr) if sequences.all?{|seq| seq.to_s.include? substr }
      end
    end
  end
    
  protected
    
    def count_sequence_symbols
      @symbol_counts = Hash.new(0)
      @string.each_char { |symbol| @symbol_counts[symbol] += 1 }
    end
  end
end
