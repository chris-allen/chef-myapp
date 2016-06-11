#
# Cookbook Name:: chef-myapp
# Recipe:: server
#
# Copyright (C) 2016 Chris Allen
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apache2"
include_recipe "apache2::mod_rewrite"
include_recipe "apache2::mod_php5"
apache_module "mpm_event" do
  enable false
end
apache_module "mpm_prefork" do
  enable true
end

if Dir.exists? "/home/vagrant"
  user = "vagrant"
  domain = "localhost"
else
  user = "ubuntu"
  app = search("aws_opsworks_app").first
  domain = "#{app['domains'][0]}"
end

web_app "myapp" do
  template "vhost.conf.erb"
  docroot "/home/#{user}/myapp/myapp"
  server_name "#{domain}"
  enable true
end

service "apache2" do
  action :restart
end

directory "/home/#{user}/myapp/myapp/shared/content/uploads" do
  recursive true
  mode 0777
end