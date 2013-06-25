#!/usr/bin/env ruby

# -*- coding: utf-8 -*-

require 'rubygems'
require 'yaml'
require 'aws-sdk'
require 'terminal-table'

#
config = YAML.load(File.read("config.yml"))
AWS.config(config)

#
ec2 = AWS::EC2.new(config)

#
rows = []
ec2.instances.each do |instance|
  rows << ["#{instance.id}","#{instance.hypervisor}","#{instance.ip_address}"]
end

#
table = Terminal::Table.new :headings => ['id', 'hypervisor','ipaddress'], :rows => rows

#
puts table
