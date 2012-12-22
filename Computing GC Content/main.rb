require_relative 'lib/rosalind'

fasta_data = Rosalind::Fasta.new(ARGF.read)
sorted_tuples = fasta_data.sort_by_GC_content
highest_GC = sorted_tuples.last
puts highest_GC[0]
puts fasta_data[highest_GC[0]].percentage_GC_content_string
