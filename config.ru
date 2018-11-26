# frozen_string_literal: true

ENV['RACK_ENV'] ||= 'development'

require 'json'
require 'uri'
require 'logger'
require 'rubygems'
require 'bundler'

# Pull in all of the gems including those in the `test` group
Bundler.require :default, ENV['RACK_ENV']

# Setup logger
LOGGER ||= Logger.new("log/#{ENV['RACK_ENV']}.log")
LOGGER.level = Logger::WARN

# Load some useful gems for development
if development?
  LOGGER.level = Logger::DEBUG
  require 'sinatra/reloader'
  require 'byebug'
end

# Loads environment variables
APP_PATH ||= File.dirname(__FILE__)
config_path = [APP_PATH, 'config/config.yml'].join('/')
CONFIG ||= Hashie::Mash.load(config_path)[ENV['RACK_ENV']]

# Configure Sinatra to use Puma
configure do
  set :root, APP_PATH
  set :public_folder, File.expand_path('app/assets', __dir__)
  set :environment, ENV['RACK_ENV']
  set :sessions, true
  set :logging, true
  set :server, :puma
  # set :mongo, Mongo::Client.new([CONFIG[:mongo_url]])
end

# Load application
Dir['app/**/*.rb'].each do |file|
  require File.expand_path("../#{file}", __FILE__)
end

run ApplicationController
