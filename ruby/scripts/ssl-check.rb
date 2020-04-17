#!/usr/bin/env ruby

# https://www.reddit.com/r/ruby/comments/8kkbb7/monitoring_ssl_certificates_expiry_with_ruby/

require 'net/http'
require 'openssl'

if ARGV.length != 1
  STDERR.puts "Pass DOMAIN_NAME argument"
  exit(1)
end

domain_name = ARGV[0]
uri = URI::HTTPS.build(host: domain_name)
response = Net::HTTP.start(uri.host, uri.port, :use_ssl => true)
cert = response.peer_cert

two_weeks = 14 * 86400 # 14 * One Day

if Time.now + two_weeks > cert.not_after
  time_remaining = (cert.not_after - Time.now)
  days_remaining = time_remaining / 86400

  STDERR.puts "Certificate for #{domain_name} will expire in #{days_remaining.to_i} days. Please renew soon."
  exit(1)
end
