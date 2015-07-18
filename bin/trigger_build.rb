#!/usr/bin/env ruby

require 'curb'
require 'json'

LIST = ARGV.empty? ? (ENV['TRIGGER_TOKENS'] || '').split('|') : ARGV
fail('No arguments or env var provided') if LIST.empty?

URL = 'https://registry.hub.docker.com/u/%s/trigger/%s/'

CLIENT = Curl::Easy.new do |c|
  c.headers['Content-Type'] = 'application/json'
end

PAYLOAD = {'build' => true}

LIST.map { |x| x.split(':') }.each do |repo, token|
  puts "Triggering build for #{repo}"
  repo_url = URL % [repo, token]
  CLIENT.url = repo_url
  CLIENT.http_post(PAYLOAD)
end
