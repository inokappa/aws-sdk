#!/usr/bin/env ruby

# -*- coding: utf-8 -*-

require 'rubygems'
require 'yaml'
require 'aws-sdk'

#
config = YAML.load(File.read("config.yml"))
AWS.config(config)

#
ec2 = AWS::EC2.new(config)

#
puts "id\t\thypervisor\tipaddress" 
ec2.instances.each do |instance|
  puts "#{instance.id}\t#{instance.hypervisor}\t\t#{instance.ip_address}"
end
