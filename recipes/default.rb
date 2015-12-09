#
# Cookbook Name:: awesome_appliance
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
require 'pp'

platform_fam = node['platform_family']
pp "Platform Family: #{platform_fam}"

case platform_fam
when 'debian'
  execute 'apt-get update'
when 'rhel'
  execute 'yum -y update'
end

#execute 'apt-get upgrade'

include_recipe 'awesome_appliance::apache'
include_recipe 'awesome_appliance::mysql'
include_recipe 'awesome_appliance::app'
