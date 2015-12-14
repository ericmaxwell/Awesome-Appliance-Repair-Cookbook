#
# Cookbook Name:: awesome_appliance
# Recipe:: apache
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# Install Apache service
package node.default['awesome_appliance']['apache_service_name']

# Enable and start Apache service
service node.default['awesome_appliance']['apache_service_name'] do
  action [ :enable, :start]
end
