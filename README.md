[Linguist](http://github.com/github/linguist) is the savant behind GitHub
dealing with language detection and statistics.

## Background ##

[Docas](http://github.com/baoshan/docas) invokes linguist from the shell command line,
which have to bear a one-second startup procedure for loading gems.

This is not a huge problem in a stand-alone environment (developer generates the
documentation for her repository through the ```[docas](http://github.com/baoshan/docas)```
command-line), but is uneconomic in a software-as-a-service scenario, and also hurts performance.

## Exposed APIs ##

Linguist_http uses sinatra to wrap Linguist as a http service, providing two apis:

  1. (get) /repo/<expanded_path_of_the_repository>, offering language statistics.
  2. (get) /file/<expanded_path_of_the_repository>, listing documentable sources.

## Installation ##

  1. clone the repository: `git clone git@github.com:baoshan/linguist_http`
  2. change the directory: `cd linguist_http`
  3. install dependencies: `bundle install`
  4. kickstart the server: `ruby app.rb`
