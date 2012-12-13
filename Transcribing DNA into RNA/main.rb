require_relative 'lib/rosalind'

ARGF.each_line do |line|
  dna_string = DNA.new(line)
  puts dna_string.ASCII_base_count
end
