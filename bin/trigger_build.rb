#!/usr/bin/env ruby

require 'curb'
require 'json'

LIST = ARGV.empty? ? (ENV['TRIGGER_TOKENS'] || '').split('|') : ARGV
raise('No arguments or env var provided') if LIST.empty?

URL = 'https://registry.hub.docker.com/u/%s/trigger/%s/'.freeze

CLIENT = Curl::Easy.new do |c|
  c.headers['Content-Type'] = 'application/json'
end

PAYLOAD = { 'build' => true }.freeze

LIST.map { |x| x.split(':') }.each do |repo, token|
  puts "Triggering build for #{repo}"
  repo_url = format URL repo, token
  CLIENT.url = repo_url
  CLIENT.http_post(PAYLOAD)
end
