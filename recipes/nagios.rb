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

nagios_service 'check_http_default' do
  options 'check_command' => 'check_http!',
          'use' => 'default-service',
          'hostgroup_name' => 'web_servers'
end

nagios_hostgroup 'web_servers' do
  options 'alias'   => 'All webapp servers',
          'members' => 'challenge-1, challenge-2'
end

nagios_host 'generichosttemplate' do
  options 'use'            => 'server',
          'name'           => 'generichosttemplate',
          'register'       => 0,
          'check_interval' => 10
end
