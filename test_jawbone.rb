#!/usr/bin/env ruby

require 'yaml'
require 'jawgem'
require 'pry'
require 'pp'

config = Jawgem.symbolize_keys(YAML.load(File.open(".env.yml")))

client = Jawgem::Client.new(config[:oauth])

info, meta = client.user_info
pp info
pp meta

info, meta = client.trends

pp info.items
new_info, meta = info.next
pp new_info.items
pp meta