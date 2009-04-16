title = ARGV[0]
number = ARGV[1]
puts title, number
out = `webby ist:gist #{title.inspect}`
# creating content/200904/blueprint-sucks-use-compass/index.txt
filename = out[(out =~ /content/)..-1].strip
d = File.read(File.dirname(__FILE__) + '/' + filename)
d.gsub('28983', number)
File.open(filename, 'w') do |f|
  f.write d
end
`git add #{ filename }`
`git commit -m #{ title.inspect }`
`git push`
`webby deploy`
