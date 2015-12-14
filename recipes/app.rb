#
# Cookbook Name:: awesome_appliance
# Recipe:: app
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
package 'unzip'

# Location of zip file
repo_source = node.default['awesome_appliance']['repo_source']

# Grabs zip file from source location
remote_file '/tmp/master.zip' do
  source repo_source
  owner 'root'
  mode '0644'
  action :create_if_missing
end

# Unzip the package
execute 'unzip' do
  command 'unzip /tmp/master.zip'
  not_if{ ::File.directory?'/Awesome-Appliance-Repair-master'}
end

# Move the web files to the proper /www/ location
execute 'move_AAR_dir' do
  command 'mv /Awesome-Appliance-Repair-master/AAR /var/www/'
  not_if{ ::File.directory?'/var/www/AAR'}
end

# Make aure script has execute permissions
execute 'chmod_script_file' do
  cwd '/Awesome-Appliance-Repair-master'
  command "chmod +x #{node.default['awesome_appliance']['script_to_run']}"
end

# MySQL password
mysql_pass = node.default['awesome_appliance']['mysql_root_pass']

# Execute installer script
execute "./#{node.default['awesome_appliance']['script_to_run']} #{mysql_pass}" do
  cwd '/Awesome-Appliance-Repair-master'
end

# execute
execute 'apachectl graceful'


#execute 'run_init_sscript' do
#  command 'python /Awesome-Appliance-Repair-master/AARinstall.py password'
#end
