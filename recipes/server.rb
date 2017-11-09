#
# Cookbook:: apache
# Recipe:: server
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#

#
# Hack to force ubuntu to app-update before apt-install
#
# apt_update 'update' do
# 	ignore_failure
# end

package 'Install Apache' do
	case node[:platform]
	when 'ubuntu', 'debian'
		package_name 'apache2'
	else
		package_name 'httpd'
	end
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  mode '0644'
end

service 'Enable Start WebServer' do
	case node[:platform]
	when 'ubuntu', 'debian'
		service_name 'apache2'
	else
		service_name 'httpd'
	end
  action [:enable, :start]
end
