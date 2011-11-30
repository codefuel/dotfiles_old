#!/usr/bin/env ruby

home = File.expand_path('~')

Dir['*'].each do |file|
  next if file =~ /install/ || file =~ /README/
  target = File.join(home, ".#{file}")

  if File.exists?(target)
    puts "*** FILE EXISTS: Creating a backup file for #{target}"
    `cp -r #{target} #{target}.#{Time.new.strftime("%Y%m%d")}`
  end

  `ln -fns #{File.expand_path file} #{target}`
end

