#
# Cookbook:: expensify
# Recipe:: firewall_external
#
# Copyright:: 2017, Justin Dugger, All Rights Reserved.

node.default['firewall']['allow_ssh'] = true
node.default['firewall']['allow_icmp'] = true
node.default['firewall']['ubuntu_iptables'] = true
include_recipe 'firewall::default'

firewall_rule 'http' do
  port     80
  protocol :tcp
  command  :allow
end
