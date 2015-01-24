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
  keys_array = counts_hash.keys
  puts "The counts for #{keys_array} are..."
  counts_hash.each do |key, value|
    puts "#{key}   #{value}"
  end
  puts
end
# Test
item_counts([1,2,1,2,1])
item_counts(["a","b","a","b","a","ZZZ"])
item_counts([])
item_counts(["hi", "hi", "hi"])
item_counts([true, nil, "dinosaur"])
item_counts(["a","a","A","A"])
