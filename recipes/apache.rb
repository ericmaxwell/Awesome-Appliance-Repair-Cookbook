#
# Cookbook Name:: awesome_appliance
# Recipe:: apache
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
platform_fam = node['platform_family']

case platform_fam
when 'debian'
  apache_service_name = 'apache2'
when 'rhel'
  apache_service_name = 'httpd'
end

package apache_service_name

service apache_service_name do
  action [ :enable, :start]
end
