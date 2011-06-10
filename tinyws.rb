#!/usr/bin/ruby

require 'optparse'
require 'webrick'
include WEBrick

port = 8080

OptionParser.new do |opts|
  opts.banner = "Usage: tinyws [options] <docroot>"
  opts.on('-p', '--port PORT', 'Listen port' ) do |p|
    port = p
  end
end.parse!

if ARGV.length != 1
  raise OptionParser::MissingArgument
end

docroot = ARGV[0]

server = WEBrick::HTTPServer.new(:Port => port, :DocumentRoot => docroot)

yield server if block_given?

# Shut down on sigint, sigterm
[ 'INT', 'TERM' ].each {  |signal|
  trap(signal) { server.shutdown }
}

server.start
