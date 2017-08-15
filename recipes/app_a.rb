#
# Cookbook:: expensify
# Recipe:: app_a
#
# Copyright:: 2017, Justin Dugger, All Rights Reserved.

include_recipe 'expensify::apache'

directory '/var/www/app-a/' do
  owner 'www-data'
  group 'www-data'
end

file '/var/www/app-a/index.html' do
  content 'a'
  owner 'www-data'
  group 'www-data'
end

web_app 'app-a.pwnguin.net' do
  docroot '/var/www/app-a/'
  server_name 'localhost'
  cookbook 'apache2'
end
