#
# Cookbook Name:: awesome_appliance
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
require 'pp'

platform_fam = node['platform_family']
pp "Platform Family: #{platform_fam}"

# Update package managers
case platform_fam
when 'debian'
  execute 'apt-get update'
when 'rhel'
  execute 'yum -y update'
else
  raise "Platform not supported... exiting!"
end

include_recipe 'awesome_appliance::apache'
include_recipe 'awesome_appliance::mysql'
include_recipe 'awesome_appliance::app'
