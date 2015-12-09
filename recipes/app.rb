#
# Cookbook Name:: awesome_appliance
# Recipe:: app
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
package 'unzip'

github_source = 'https://github.com/ericmaxwell/Awesome-Appliance-Repair/archive/master.zip'

remote_file '/tmp/master.zip' do
  source github_source
  owner 'root'
  mode '0644'
  action :create_if_missing
end

execute 'unzip' do
  command 'unzip /tmp/master.zip'
  not_if{ ::File.directory?'/Awesome-Appliance-Repair-master'}
end

execute 'move_AAR_dir' do
  command 'mv /Awesome-Appliance-Repair-master/AAR /var/www/'
  not_if{ ::File.directory?'/var/www/AAR'}
end

platform_fam = node['platform_family']

case platform_fam
when 'debian'
  script_to_run = 'AARinstall.py'
when 'rhel'
  script_to_run = 'AARinstall-rhel.py'
end

execute 'chmod_script_file' do
  cwd '/Awesome-Appliance-Repair-master'
  command "chmod +x #{script_to_run}"
end

mysql_pass = 'password'
execute "./#{script_to_run} #{mysql_pass}" do
  cwd '/Awesome-Appliance-Repair-master'
end

# execute
execute 'apachectl graceful'


#execute 'run_init_sscript' do
#  command 'python /Awesome-Appliance-Repair-master/AARinstall.py password'
#end
