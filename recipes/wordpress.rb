#
# Cookbook Name:: chef-myapp
# Recipe:: wordpress
#
# Copyright (C) 2016 Chris Allen
#
# All rights reserved - Do Not Redistribute
#

if Dir.exists? "/home/vagrant"
  user = "vagrant"
else
  user = "ubuntu"
end

# directory "/home/#{user}/myapp/myapp/shared/content/uploads" do
#   recursive true
#   mode 0777
# end

service "apache2" do
  action :restart
end