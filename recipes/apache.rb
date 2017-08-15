#
# Cookbook:: expensify
# Recipe:: apache
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'apt'

node.default['apache']['mpm'] = 'prefork'
node.default['apache']['prefork']['startservers'] = 2
node.default['apache']['prefork']['minspareservers'] = 2
node.default['apache']['prefork']['maxspareservers'] = 4
node.default['apache']['prefork']['serverlimit'] = 16

include_recipe 'apache2'
