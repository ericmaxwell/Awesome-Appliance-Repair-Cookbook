#
# Cookbook Name:: awesome_appliance
# Recipe:: mysql
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
mysql_service 'default' do
  port '3306'
  version '5.6'
  initial_root_password node.default['awesome_appliance']['mysql_root_pass']
  action [:create, :start]
end

#execute 'su mysql'
execute 'ln -s /var/run/mysql-default/mysqld.sock /var/run/mysqld/mysqld.sock'
