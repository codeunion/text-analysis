puts "You ran this program with #{ARGV.size} arguments."
puts ""

if ARGV.size == 0
  puts "Try running these commands to explore how command-line arguments work:"
  puts ""
  puts "    ruby args.rb apple"
  puts "    ruby args.rb dog cat"
  puts "    ruby args.rb -f how-does-this-work.txt"
  puts "    ruby args.rb 5 4 3 2 1 blastoff"
else
  ARGV.each_with_index do |argument, i|
    puts "ARGV[#{i}] is the string '#{argument}'"
  end
end

puts ""
puts "This is a demonstration of how command-line arguments work in Ruby."
puts ""

puts "Command-line arguments are an optional, space-separated list of strings"
puts "that can be passed to *any* command-line program. They're not unique to Ruby."
puts ""
puts "The arguments are made available to your Ruby program through the pre-defined"
puts "array ARGV, which is an array of strings containing the command-line arguments."
