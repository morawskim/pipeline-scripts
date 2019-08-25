#!/usr/bin/env ruby

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
require 'bundler'
Bundler.setup(:default)

require_relative '../lib/pipeline'

branch = ARGV[0]
puts "Check branch: #{branch}"
command = BranchName.new(branch)
result = command.run
raise Exception.new("Wrong branch name: #{branch}") unless result
