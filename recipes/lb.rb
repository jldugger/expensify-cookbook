#
# Cookbook:: expensify
# Recipe:: lb
#
# Copyright:: 2017, Justin Dugger, All Rights Reserved.

haproxy_install 'package'

haproxy_config_defaults 'defaults' do
  mode 'http'
  timeout connect: '2s',
          client: '50s',
          server: '50s'
  retries 1
end

haproxy_frontend 'http-in' do
  bind '*:60000-65000'
  default_backend 'servers'
  option %w[forwardfor]
end

haproxy_backend 'servers' do
  extra_options(
    'stick-table' => 'type ip size 20k',
    'stick' => 'on src',
    'option' => 'httpchk'
  )
  server [
    'app-a 10.202.183.93:80 maxconn 32 check',
    'app-b 10.226.14.201:80 maxconn 32 check'
  ]
end
