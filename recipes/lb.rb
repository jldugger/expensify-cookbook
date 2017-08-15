#
# Cookbook:: expensify
# Recipe:: lb
#
# Copyright:: 2017, Justin Dugger, All Rights Reserved.

haproxy_install 'package'

haproxy_config_defaults 'defaults' do
  mode 'http'
  timeout connect: '5s',
          client: '50s',
          server: '50s'
  retries 3
end

haproxy_frontend 'http-in' do
  bind '*:60000-65000'
  default_backend 'servers'
  option %w[forwardfor]
end

haproxy_backend 'servers' do
  extra_options(
    'stick-table' => 'type ip size 20k'
  )
  server [
    'app-a 54.177.50.202:80 maxconn 32',
    'app-b 54.219.249.39:80 maxconn 32'
  ]
end
