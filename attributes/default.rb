case node['platform']
when 'ubuntu'
	default['apache']['package_name'] = 'apache2'
else
	default['apache']['p[ackage_name'] = 'httpd'
end