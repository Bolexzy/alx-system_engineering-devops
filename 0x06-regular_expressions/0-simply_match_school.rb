#!/usr/bin/env ruby

# Define the regular expression pattern for School
pattern = /School/

puts ARGV[0].scan(pattern).join
