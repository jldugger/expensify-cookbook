#
# Cookbook:: expensify
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

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

node.default['sudo']['passwordless'] = true
node.default['authorization']['sudo']['agent_forwarding'] = true

include_recipe 'sudo'
