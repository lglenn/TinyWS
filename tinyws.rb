require 'sinatra'

root = '/Users/larry/Projects/TinyWS'

mime_types = {  'html' => 'text/html', 'css' => '}
get '/*.*' do |path,ext|
  filename = "#{root}/#{path}.#{ext}"
  headers = {}
  status = 200
  body = ''
  headers['Content-Type'] = content_type ext
  if File.exists?(filename)
    file = File.new("#{root}/#{path}.#{ext}")
    file.each() do |line|
      body += line
    end
  else
      status = 404
  end
  return status, headers, body
end

def content_type(ext)
  case ext
  when 'html'
    'text/html'
  when 'txt'
    'text/plain'
  when 'css'
    'text/css'
  when 'js'
    'text/javascript'
  when 'png'
    'image/png'
  when 'gif'
    'image/gif''
  end
end
