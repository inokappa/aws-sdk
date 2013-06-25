#!/usr/bin/env ruby

# -*- coding: utf-8 -*-

require 'rubygems'
require 'yaml'
require 'aws-sdk'
require 'terminal-table'
require 'pp'
#
config = YAML.load(File.read("config.yml"))
AWS.config(config)

#
ec2 = AWS::EC2.new(config)

#
rows = []
ec2.instances.each do |instance|
#ec2.instances.each_with_index do |instance,i|
  rows << ["#{instance.id}","#{instance.hypervisor}","#{instance.ip_address}","#{instance.status}"]
#  puts "#{i}"
#puts instance.methods.sort
puts (instance.methods - instance.class.superclass.instance_methods).sort
#puts instance.class
#puts instance.class.superclass
end

#
table = Terminal::Table.new :headings => ['id', 'hypervisor','ipaddress','status'], :rows => rows

#
puts table
