require 'rubygems'
require 'bundler'
require 'bundler/setup'

Bundler.require(:test)

$LOAD_PATH.unshift(Dir.pwd)
require 'config'

