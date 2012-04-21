require 'rubygems'
require 'bundler/setup'
require 'linguist'

list = `find "/Users/Sheng/GitHub/Docas" -type fi -not -path '*/\.git/*'`
list.strip!
list = list.split("\n")

puts list.length

list.each do |source|
  blob = Linguist::FileBlob.new(source)
  puts "#{source}"
  next if blob.vendored? || blob.generated? || blob.language.nil?
end
#
puts "abc"
puts "def"
