require 'webrick'
include WEBrick

root = '/Users/larry/Projects/TinyWS/docroot'
port = 8080
config = {  :Port => port, :DocumentRoot => root }
server = WEBrick::HTTPServer.new(config)
server.start
