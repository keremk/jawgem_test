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

info, meta = client.sleeps(start_time: (Time.now - 7.days), end_time: Time.now)
pp info.items
pp meta

# info, meta = client.create_body_measurement(weight: 190)
# pp info
# pp meta 

# info, meta = client.create_sleep({ time_created: Time.now - 18.hours, time_completed: Time.now - 10.hours})
# pp info
# pp meta 

#info, meta = client.trends

#pp info.items
#new_info, meta = info.next
#pp new_info.items
#pp meta