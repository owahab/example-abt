# frozen_string_literal: true

workers 1
threads_min = 2
threads_max = 4
threads threads_min, threads_max

port ENV['PORT'] || 4000
environment ENV['RACK_ENV'] || 'development'
rackup DefaultRackup
