require_relative './max'

if ARGV.size == 0
  puts "You didn't tell us what file to read. Try this commmand:"
  puts
  puts "  ruby textalyze.rb random_file.txt"
  exit # Exits the program
end

file_name = ARGV[0] #first argument
file_contents = File.read(file_name) # Files will have to be in same directory
# as textalyze.rb - simimlar to v0.4.

def item_counts(array)
  counts = {} # Initialize counts to an empty Hash
  array.each do |key|
    if counts[key] # If this key exists
      counts[key] += 1 # Increment the key
    else # If this key doesn't exist
      counts[key] = 1 # Create the key, set value to 1
    end
  end
  # print_counts(counts)
  counts
end

def print_counts(counts_hash)
  puts
  counts_hash.each do |key, value|
    puts "#{key}   #{value}"
  end
  puts
end

def string_to_array(string) # returns array of all characters in the string
  sanitize(string)
  string.split(//)
end

def sanitize(string)
  string.downcase!
  string.gsub!(/\W+/, '') # Remove all non-word chars
end

# v1.1
def frequency(string)
  hash = item_counts(string_to_array(string)) # returns counts hash
  hash.each do |key, value|
    hash[key] = value.to_f/string.size.to_f
  end
  hash
end

# Notes on v.1.2
# remove all non word chars - add to sanitize
# take hash as input
# round hash values to 2 places
# force 0.00 format, figure our alignment
# format as percent in output
# scale bars to terminal width
# get the bars to print out correctly next to the values

def print_histo(stats)
  ordered_stats = stats.sort
  print "Calculating letter frequencies...done"
  ordered_stats.each do |key, value|
    percent = (value*100).round(2)
    puts
    print "[#{key}] [#{'%5.2f' % percent}%] " # This was trial and error.
    # I don't have full understanding yet
    print "="*((scaled_value(value, stats.values)))
  end
  puts
end

def scaled_value(num, range)
  # I had to look up the equation below - it feels like something
  # I should remember from high school math. Time for a refresher?
  # ((to_max - to_min)* (num - from_min)) / ((from_max - from_min) + to_min)
  to_max = terminal_size # Reasonable screen width?
  to_min = 0
  from_max = max(range)
  from_min = 0
  ((to_max - to_min) * (num - from_min)) / ((from_max - from_min) + to_min)
end

def terminal_size
  # found this at  http://stackoverflow.com/a/2352441
  dimension = `stty size`.split.map { |x| x.to_i }.reverse
  dimension[0]-13 # first item in array is the x value of the terminal dimension
  # subtract width of chars preceding the bar. Not sure how to derive this.
end
# Test v1.2
print_histo(frequency(file_contents))
# Test v1.1
# print_counts(frequency(file_contents))
# Test v0.4 and v1.0
# item_counts(string_to_array(file_contents))
# Test v.03
#item_counts(string_to_array("The quick brown fox jumped over the lazy dog."))
#item_counts(string_to_array("111-jazzhands birkenstock!!!()*$    @@@Values__=+`~"))
