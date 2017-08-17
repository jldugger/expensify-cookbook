#
# Cookbook:: expensify
# Recipe:: default
#
# Copyright:: 2017, Justin Dugger, All Rights Reserved.

%w[htop httping traceroute mtr-tiny].each do |pkg|
  package pkg
end

user 'expensify' do
  comment 'a simple user'
  manage_home true
end

directory '/home/expensify/.ssh/'

cookbook_file '/home/expensify/.ssh/authorized_keys' do
  mode '0600'
  owner 'expensify'
  source 'expensify-keys'
end

group 'sysadmin' do
  members 'expensify'
end

node.default['authorization']['sudo']['passwordless'] = true
node.default['authorization']['sudo']['users'] = ['expensify']
node.default['authorization']['sudo']['agent_forwarding'] = true
node.default['authorization']['sudo']['include_sudoers_d'] = true
include_recipe 'sudo'
