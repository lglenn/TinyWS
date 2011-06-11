#!/usr/bin/ruby

require 'optparse'
require 'webrick'
include WEBrick

port = 8080

options = OptionParser.new do |opts|
  opts.banner = "Usage: tinyws [options] <docroot>\n\nOptions:"
  opts.on('-p', '--port PORT', 'Listen port' ) do |p|
    port = p
  end
end

options.parse!

if ARGV.length != 1
  puts
  puts options.help
  puts
  Process.exit(1)
end

docroot = ARGV[0]

server = WEBrick::HTTPServer.new(:Port => port, :DocumentRoot => docroot)

yield server if block_given?

# Shut down on sigint, sigterm
[ 'INT', 'TERM' ].each {  |signal|
  trap(signal) { server.shutdown }
}

server.start
