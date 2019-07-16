#!/usr/bin/env ruby

require "bundler/setup"
require_relative "../lib/NYC_Events.rb"

NYC_Events::CLI.new

# update readme, confirm that it scrapes today's events vs tomorrow's events?
# review all repository files -- are all files necessary?
