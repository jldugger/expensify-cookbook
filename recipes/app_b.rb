#
# Cookbook:: expensify
# Recipe:: app_b
#
# Copyright:: 2017, Justin Dugger, All Rights Reserved.

include_recipe 'expensify::apache'

directory '/var/www/app-b/' do
  owner 'www-data'
  group 'www-data'
end

file '/var/www/app-b/index.html' do
  content 'b'
  owner 'www-data'
  group 'www-data'
end

web_app 'app-b.pwnguin.net' do
  docroot '/var/www/app-b/'
  server_name 'localhost'
  cookbook 'apache2'
end
