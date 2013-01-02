require_relative '../../lib/rosalind'

ARGF.each_line do |line|
  rna_string = Rosalind::RNA.new(line)
  puts rna_string.to_protein
end

