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
ec2.instances.each do |instance|
  puts 'instance.hypervisor' + 'instance.ip_address'
end
