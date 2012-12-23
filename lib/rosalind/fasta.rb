module Rosalind
  class Fasta
    def initialize(fasta_string)
      @fasta_string = fasta_string
      @fasta_hash = parse_fasta_strings
    end
    
    def each(&block)
      @fasta_hash.each(&block)
    end
    
    def length
      @fasta_hash.length
    end
    
    alias_method :size, :length
    
    def has_key?(key)
      @fasta_hash.has_key? key
    end
    
    def [](key)
      @fasta_hash[key]
    end
    
    # Returns an array of tuples. The tuples are the key and the value from the original hash.
    def sort_by_GC_content
      @fasta_hash.sort_by { |identifier, nucleic_acid | nucleic_acid.percentage_GC_content }
    end
    
    protected
    def parse_fasta_strings
      fasta_hash = {}
      fasta_array = @fasta_string.split('>')
      fasta_array.slice!(0)
      fasta_array.each do |fasta_entry|
        entry_array = fasta_entry.split("\n")
        fasta_hash[entry_array.shift] = Rosalind::NucleicAcid.new(entry_array.join)
      end
      fasta_hash
    end
  end
end