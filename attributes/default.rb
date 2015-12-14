# Determine platform so we know which Apache service to install
case node['platform_family']
when 'debian'
  default['awesome_appliance']['apache_service_name'] = 'apache2'
  default['awesome_appliance']['package_update_command'] = 'apt-get update'
  default['awesome_appliance']['script_to_run'] = 'AARinstall.py'
when 'rhel'
  default['awesome_appliance']['apache_service_name'] = 'httpd'
  default['awesome_appliance']['package_update_command'] = 'yum -y update'
  default['awesome_appliance']['script_to_run'] = 'AARinstall-rhel.py'
else
  raise "Platform not supported... exiting!"
end

default['awesome_appliance']['repo_source'] = 'https://github.com/ericmaxwell/Awesome-Appliance-Repair/archive/master.zip'
default['awesome_appliance']['mysql_root_pass'] = 'password'
