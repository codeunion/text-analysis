require "io/console"

def item_counts(array)
  counts = Hash.new(0)

  array.each do |key|
    counts[key] += 1 # Increment the key
  end

  counts
end

def print_counts(counts_hash)
  counts_hash.each do |key, value|
    puts "#{key}   #{value}\n"
  end
end

def string_to_array(string) # returns array of all characters in the string
  sanitize(string).split(//)
end

def sanitize(string)
  string.downcase.gsub(/\W+/, '') # Remove all non-word chars
end

def frequency(string)
  hash = item_counts(string_to_array(string)) # returns counts hash

  hash.each do |key, value|
    hash[key] = value.to_f / string.size.to_f
  end

  hash
end

def scaled_value(num, range, offset)
  # I had to look up the equation below - it feels like something
  # I should remember from high school math. Time for a refresher?
  # ((to_max - to_min)* (num - from_min)) / ((from_max - from_min) + to_min)
  to_max = terminal_width(offset)
  to_min = 0
  from_max = range.max
  from_min = 0
  ((to_max - to_min) * (num - from_min)) / ((from_max - from_min) + to_min)
end

def terminal_width(offset)
  dimensions = IO.console.winsize

  dimensions[1]-offset
end

def print_histo(stats)
  ordered_stats = stats.sort

  print "Calculating letter frequencies...done"

  ordered_stats.each do |key, value|
    percent = (value*100).round(2)
    puts
    key_data_string = sprintf("[%s] [%5.2f%%] ", key, percent)
    print key_data_string
    print "="*((scaled_value(value, stats.values, key_data_string.length)))
  end

  puts
end

def file_read(argument)
  if argument.size == 0
    puts "You didn't tell us what file to read. Try this commmand:"
    puts
    puts "  ruby textalyze.rb random_file.txt"
    exit # Exits the program
  end

  file_name = argument[0] #first argument

  File.read(file_name)
end

print_histo(frequency(file_read(ARGV)))
