require_relative '../../lib/rosalind'

dnas = []

ARGF.each_line do |line|
  dnas << Rosalind::DNA.new(line)
end

dna_1, dna_2 = dnas

indexes = dna_1.find_substring_indexes(dna_2)

puts indexes.join(' ')
