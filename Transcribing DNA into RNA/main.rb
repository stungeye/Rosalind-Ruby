require_relative '../lib/rosalind'

ARGF.each_line do |line|
  dna_string = Rosalind::DNA.new(line)
  rna_string = dna_string.to_rna
  puts rna_string.to_s
end
