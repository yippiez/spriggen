
require '../lib/terminal'

puts "Gradient display using Terminal".fg "white"
puts "-"*80
# gradient display
grad = Array.new(12) { |i| Array.new(30) { [i*20,i*20,i*20] } }
Terminal.display_image(grad)
puts "-"*80
puts

puts "List test".fg "white"
puts "-"*80
item_list = ['item1', 'item2', 'item3']
Terminal.display_list(item_list)
puts "-"*80
