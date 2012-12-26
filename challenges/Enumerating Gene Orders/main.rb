# From the command line: ruby main.rb n
#
# Where n is a positive integer <= 7.
#
# Returns the total number of permutations of length n,
# followed by a list of all such permutations.

unless ARGV.length.zero?
  
  permutation_length = ARGV[0].to_i
  
  integer_set = []
  permutation_length.times { |i| integer_set << (i + 1) }
  
  all_permuations = integer_set.permutation.to_a
  
  puts all_permuations.length
  all_permuations.each { |set| puts set.join(' ') }
  
end

