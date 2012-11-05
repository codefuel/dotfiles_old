require 'rubygems'
require 'irb/ext/save-history'

require_gems = %w(wirble net-http-spy awesome_print looksee)

# Add all gems installed in the system to the $LOAD_PATH so they can be used in Rails console with Bundler
current_ruby_version = `rbenv version`.split(' ').first
gem_paths = Dir.glob("#{ENV["HOME"]}/.rbenv/versions/#{current_ruby_version}/lib/ruby/gems/**/gems/*/lib")
gem_paths.each do |path|
  require_gems.each do |gem|
    $LOAD_PATH << path if path.include?(gem)
  end
end

require 'wirble'
require 'net-http-spy'
require 'awesome_print'

### Looksee
require 'looksee'
# Each object has a method ls, which shows you all its method
# Methods are colored according to whether they're public, protected, private, undefined (using Module#undef_method), or overridden.

# You can hide, say, private methods like this:
# irb> [].ls :noprivate

# Or filter the list by Regexp:
# irb> [].ls /^to_/

# And if you want to know more about any of those methods, Looksee can take you straight to the source in your editor:
# > [].edit('to_set')

# irb> Looksee.help

IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"

# Load wirble
Wirble.init
Wirble.colorize

# Easily print methods local to an object's class
class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end

