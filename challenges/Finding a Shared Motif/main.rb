require_relative '../../lib/rosalind'

rnas = []

ARGF.each_line do |line|
  rnas << Rosalind::DNA.new(line)
end

require 'benchmark'

time = Benchmark.measure do
  puts Rosalind::Sequence.longest_common_substring(rnas)
end

puts time

