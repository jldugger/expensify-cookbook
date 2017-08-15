#
# Cookbook:: expensify
# Recipe:: nagios
#
# Copyright:: 2017, Justin Dugger, All Rights Reserved

include_recipe 'apt::default'
include_recipe 'nagios::default'

nagios_command 'check_http' do
  options 'command_line' => '$USER1$/check_http -H $HOSTADDRESS$ -w $ARG1$ -c $ARG2$ -t 20 -f $ARG3$'
end

nagios_service 'check_http_default' do
  options 'check_command' => 'check_http!1,5,ok',
          'use' => 'default-service',
          'hostgroup_name' => 'web_servers'
end

nagios_hostgroup 'web_servers' do
  options 'alias'   => 'All webapp servers',
          'members' => 'appa, appb'
end

nagios_host 'generichosttemplate' do
  options 'use'            => 'server',
          'name'           => 'generichosttemplate',
          'register'       => 0,
          'check_interval' => 10
end

nagios_host 'appa.pwnguin.net' do
  options 'use'           => 'generichosttemplate',
          'host_name'     => 'appa',
          'address'       => '54.177.50.202'
end

nagios_host 'appb.pwnguin.net' do
  options 'use'           => 'generichosttemplate',
          'host_name'     => 'appb',
          'address'       => '54.219.249.39'
end
