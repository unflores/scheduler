require 'rubygems'
require 'bundler'
require 'bundler/setup'

$LOAD_PATH.unshift(Dir.pwd)

Bundler.require(:default)

require 'csv'

Dir.glob('lib/**/*.rb').each { |r| require Dir.pwd + '/' + r }
