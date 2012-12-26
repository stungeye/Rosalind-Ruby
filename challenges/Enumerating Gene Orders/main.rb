unless ARGV.length.zero?
  
  ARGV.each do |a|
    
    permutation_length = a.to_i
    
    integer_set = []
    permutation_length.times { |i| integer_set << (i + 1) }
    
    all_permuations = integer_set.permutation.to_a
    
    puts all_permuations.length
    all_permuations.each { |set| puts set.join(' ') }
    
  end
  
end

