#
# Cookbook:: expensify
# Recipe:: nagios
#
# Copyright:: 2017, Justin Dugger, All Rights Reserved

include_recipe 'apt::default'
include_recipe 'nagios::default'

nagios_command 'check_http' do
  options 'command_line' => '$USER1$/check_http -H $HOSTADDRESS$ -w 1 -c 5 -t 20 -f stickyport'
end

nagios_command 'check_http_high_port' do
  options 'command_line' => '$USER1$/check_http -H $HOSTADDRESS$ -p 63000 -w 1 -c 5 -t 20 -f stickyport'
end

nagios_service 'check_http_default' do
  options 'check_command' => 'check_http!',
          'use' => 'default-service',
          'hostgroup_name' => 'web_servers'
end

nagios_service 'check_http_lb' do
  options 'check_command' => 'check_http_high_port!',
          'use' => 'default-service',
          'hostgroup_name' => 'load_balancers'
end

nagios_hostgroup 'web_servers' do
  options 'alias'   => 'All webapp servers',
          'members' => 'challenge-1, challenge-2'
end

nagios_hostgroup 'load_balancers' do
  options 'alias'   => 'All load balancer servers',
          'members' => 'challenge-3'
end

nagios_host 'generichosttemplate' do
  options 'use'            => 'server',
          'name'           => 'generichosttemplate',
          'register'       => 0,
          'check_interval' => 10
end
