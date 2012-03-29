A dead simple HTTP wraper for linguist, offering interoperability for node.js, while
reducing the linguist CLI startup time through a persistent sinatra server.

## Background ##

[Linguist](http://github.com/github/linguist) is the savant behind GitHub
dealing with language detection and statistics.


[Docas](http://github.com/baoshan/docas) invokes linguist from the shell command line,
which have to bear a one-second startup procedure for loading gems.

This is not a huge problem in a stand-alone environment (developer generates the
documentation for her repository through the ```docas``` command-line), but is uneconomic
in a software-as-a-service scenario, and also hurts performance.

## Exposed APIs ##

Linguist_http uses sinatra to wrap Linguist as a http service, providing two apis:

  1. `(get) /repo/<expanded_path_of_the_repository>`, offering language statistics.
  2. `(get) /file/<expanded_path_of_the_repository>`, listing documentable sources.

## Installation ##

```
git clone git@github.com:baoshan/linguist_http
cd linguist_http
bundle install
ruby app.rb
```
