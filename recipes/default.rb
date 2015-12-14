#
# Cookbook Name:: awesome_appliance
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# DEBUG
#require 'pp'
#pp "Package update command: #{node.default['awesome_appliance']['apache_service_name']}"
#pp "Apache service name: #{node.default['awesome_appliance']['package_update_command']}"
#pp "Script to run: #{node.default['awesome_appliance']['script_to_run']}"

# Update package managers
execute node.default['awesome_appliance']['package_update_command']

include_recipe 'awesome_appliance::apache'
include_recipe 'awesome_appliance::mysql'
include_recipe 'awesome_appliance::app'
