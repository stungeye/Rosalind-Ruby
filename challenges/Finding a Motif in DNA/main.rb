require_relative '../../lib/rosalind'

dnas = []

ARGF.each_line do |line|
  dnas << Rosalind::DNA.new(line)
end

dna_1, dna_2 = dnas

puts dna_1.hamming_distance(dna_2)
