# This is the base code for v0.1 of our Ruby text analyzer.
# Visit https://github.com/codeunion/text-analysis/wiki to see what to do.
#
# Send an email to your cohort mailing list if you have any questions
# or you're stuck!  These comments are here to help you, but please delete them
# as you go along. You wouldn't normally have such heavily-commented code.

# Method name: item_counts
# Input:   An arbitrary array
#
# Returns: A hash where every item is a key whose value is the number of times
#          that item appears in the array
#
# Prints:  Nothing

# Here are some examples:
#     item_counts(["I", "am", "Sam", "I", "am"])
#       # => {"I" => 2, "am" => 2, "Sam" => 1}
#
#     item_counts([10, 20, 10, 20, 20])
#       # => {10 => 2, 20 => 3}
#
# In short, item_counts(array) tells us how many times each item appears
# in the input array.
file_contents = File.read("moby-dick.txt") # had trouble with path on cloud9 so
# I put the file in the the directory with textalyze.rb
# this is the path I tried: ~/workspace/sprint1/text-analysis/sample_data/moby-dick.txt

def item_counts(array)
  counts = {} # Initialize counts to an empty Hash
  array.each do |key|
    if counts[key] # If this key exists
      counts[key] += 1 # Increment the key
    else # If this key doesn't exist
      counts[key] = 1 # Create the key, set value to 1
    end
  end
  print_counts(counts)
end

def print_counts(counts_hash)
  counts_hash.each do |key, value|
    puts "#{key}   #{value}"
  end
  puts
end

def string_to_array(string) # returns array of all characters in the string
  #puts "The counts for \"#{string}\" are..."
  sanitize(string)
  string.split(//)
end

def sanitize(string)
  string.downcase!
end
# Test v.04
item_counts(string_to_array(file_contents))
# Test v.03
#item_counts(string_to_array("The quick brown fox jumped over the lazy dog."))
#item_counts(string_to_array("111-jazzhands birkenstock!!!()*$    @@@Values__=+`~"))
