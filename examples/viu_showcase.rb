
require '../lib/viu'
require '../lib/terminal'

include Viu

puts "Viu is avaible".fg "white"
puts "-"*80
puts Viu::is_avaible?
puts "-"*80
puts

puts "Gradient display using Viu".fg "white"
puts "-"*80
grad = Array.new(12) { |i| Array.new(30) { [i*20,i*20,i*20] } }
Viu::display_rgb_array(grad)
puts "-"*80
