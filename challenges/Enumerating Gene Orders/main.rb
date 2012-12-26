# 

unless ARGV.length.zero?
  
  permutation_length = ARGV[0].to_i
  
  integer_set = []
  permutation_length.times { |i| integer_set << (i + 1) }
  
  all_permuations = integer_set.permutation.to_a
  
  puts all_permuations.length
  all_permuations.each { |set| puts set.join(' ') }
  
end

