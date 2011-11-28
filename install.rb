#!/usr/bin/env ruby

home = File.expand_path('~')

Dir['*'].each do |file|
  next if file =~ /install/ || file =~ /README/
  target = File.join(home, ".#{file}")
  `ln -ns #{File.expand_path file} #{target}`
end

