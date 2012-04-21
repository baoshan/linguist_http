require 'rubygems'
require 'bundler/setup'
require 'linguist'
require 'sinatra'

get '/statist' do
  repo = Linguist::Repository.from_directory(params['path'])
  stream do |out|
    repo.languages.sort_by { |_, size| size }.reverse.each do |language, size|
      percentage = ((size / repo.size.to_f) * 100).round
      out << "%-4s %-5s %s\n" % ["#{percentage}%", size, language]
    end
  end
end

get '/sources' do
  dir  = params['path']
  file = File.open params['list']
  stream do |out|
    file.each do |source|
        source = source.strip
        blob = Linguist::FileBlob.new dir + '/' + source
	next if blob.vendored? || blob.generated? || blob.language.nil?
        if blob.extname.empty?
	  out << (source + blob.language.primary_extension + '_' + "\n")
	else
	  dirname  = File.dirname  source
	  if dirname != '.' 
	    dirname += '/'
	  else
	    dirname = ''
	  end
	  extname  = File.extname  source
	  basename = File.basename source, extname
	  extname  = extname.sub '_', '__'
	  out << (dirname + basename + extname + "\n")
	end
    end
  end
end
