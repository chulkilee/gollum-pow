#!/usr/bin/env ruby
require 'gollum/app'

Precious::App.set :gollum_path, File.expand_path('data', __dir__)
Precious::App.set :default_markup, :markdown
Precious::App.set :wiki_options, universal_toc: false
run Precious::App
