#!/usr/bin/env ruby

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
require 'bundler'
Bundler.setup(:default)

require_relative '../lib/pipeline'

commit_title = ARGV.join(' ')
puts "Check commit title: #{commit_title}"
command = CheckCommitTitle.new(commit_title)
result = command.run
raise Exception.new("Wrong commit title: #{commit_title}") unless result
