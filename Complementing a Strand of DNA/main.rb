require_relative 'lib/rosalind'

ARGF.each_line do |line|
  dna = DNA.new(line)
  reverse_complement = dna.to_reverse_complement
  puts reverse_complement.to_s
end
