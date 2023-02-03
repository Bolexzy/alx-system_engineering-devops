#!/usr/bin/env ruby

pattern=/(?<=\[from:|\[to:|\[flags:).+?(?=\])/
puts ARGV[0].scan(pattern).join(",")
