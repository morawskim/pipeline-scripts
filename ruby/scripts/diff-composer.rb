#!/usr/bin/env ruby

#Based on https://gist.github.com/Mikulas/4a96845716361cea5eaa

require 'json'

if ARGV.length != 1
  STDERR.puts "Pass path to composer.lock"
  exit(1)
end

file = File.read(ARGV[0])
lock = JSON.parse(file)
packages = {}

lock['packages'].each do |package|
    version = package['version'].ljust(10, ' ')
    ref = package['source']['reference']

    packages[package['name']] = "#{version} #{ref}"
end

packages = packages.sort_by { |key| key }.to_h
packages.each  do |name, version|
    puts "#{name}\n #{version}\n"
end
