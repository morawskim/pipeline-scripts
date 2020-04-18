#!/usr/bin/env ruby

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
require 'bundler'
Bundler.setup(:default)

require 'rugged'

git_dir = ARGV[0]
file_name = ARGV[1]

repo = Rugged::Repository.new(git_dir)

last_commit = repo.last_commit
parent_commit = repo.last_commit.parents[0]

file = parent_commit.tree[file_name]
unless file
    STDERR.puts "File not found"
    exit(101)
end
file_oid = file[:oid]
print repo.lookup(file_oid).content
