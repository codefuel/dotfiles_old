require 'rubygems'
require 'irb/ext/save-history'

  require_gems = %w(wirble net-http-spy awesome_print looksee)
  
  # Add all gems installed in the system to the $LOAD_PATH so they can be used in Rails console with Bundler
  current_ruby_version = `rbenv version`.split(" ").first
  gem_paths = Dir.glob("#{ENV["HOME"]}/.rbenv/versions/#{current_ruby_version}/lib/ruby/gems/**/gems/*/lib")
  gem_paths.each do |path|
    require_gems.each do |gem|
      $LOAD_PATH << path if path.include?(gem)
    end
  end

  require 'wirble'
  require 'net-http-spy'
  require 'awesome_print'
  require 'looksee'

IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"

# load wirble
Wirble.init
Wirble.colorize

# Easily print methods local to an object's class
class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end

