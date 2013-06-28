#!/usr/bin/env ruby

# -*- coding: utf-8 -*-

require 'rubygems'
require 'yaml'
require 'aws-sdk'
require 'terminal-table'
#require 'pp' # for debug
#
config = YAML.load(File.read("config.yml"))
AWS.config(config)

#
ec2 = AWS::EC2.new(config)

#
COMMAND=["start", "stop", "list"]
unless ARGV.size == 1
  puts "Usage: #{$0} ${command(#{COMMAND.join(' or ')})}"
  exit 1
end

##################### list
rows = []
#ec2.instances.each do |instance|
ec2.instances.each_with_index do |instance,i|
  rows << ["#{i}","#{instance.id}","#{instance.hypervisor}","#{instance.ip_address}","#{instance.status}"]
  #puts (instance.methods - instance.class.superclass.instance_methods).sort # for debug
end
#
table = Terminal::Table.new :headings => ['no','id', 'hypervisor','ipaddress','status'], :rows => rows
#
puts table

##################### start
##################### stop

