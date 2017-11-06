# # encoding: utf-8

# Inspec test for recipe apache::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/


#
# http resource is broken for this version of chef/inspec
#
#describe http('http://localhost') do 
     #its('status') { should cmp 200 }
     #ts('body') { should match 'Ardvark'}
     #its('header') { should match 'Ardvark' }
#end


describe command('/usr/bin/curl localhost') do
	its('stdout') { should match 'HOSTNAME'}
	its('stdout') { should match /title.*Ardvark.*\<\// }
end