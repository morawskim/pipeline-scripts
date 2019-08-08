#!/usr/bin/env ruby

require 'bundler'
Bundler.setup(:default)

require 'rugged'
require_relative '../lib/pipeline'

git_dir = ARGV[0]
branch = ARGV[1]
source_branch = ARGV[2]

command = GetVersionCommand.new(git_dir, branch, source_branch)
version = command.run
puts version
