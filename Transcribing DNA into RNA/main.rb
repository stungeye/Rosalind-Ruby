require_relative 'nucleic_acid'

ARGF.each_line do |line|
  dna_string = DNA.new(line)
  puts dna_string.ASCII_ACGT_counts
end
