dna = 'GATATATGCATATACTT'
sub = 'ATAT'
indexes = {}
dna.split(//).each_with_index do |b,i|
  index = dna.index(sub,i-1)
  indexes[index] = true  unless index.nil?
end

puts indexes.keys

i = 0
indexes = []
final_index_position = dna.length - sub.length
puts final_index_position

while (i < final_index_position)
  index = dna.index(sub,i)
  break if index.nil?
  indexes << index
  i = index + 1
end

puts indexes