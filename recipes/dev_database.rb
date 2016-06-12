#
# Cookbook Name:: chef-myapp
# Recipe:: dev_database
#
# Copyright (C) 2016 Chris Allen
#
# All rights reserved - Do Not Redistribute

mysql2_chef_gem 'default' do
  action :install
end

mysql_service 'myapp' do
  initial_root_password 'password'
  action [:create, :start]
end

mysql_connection_info = {
    :host => '127.0.0.1',
    :username => 'root',
    :password => 'password'
}

mysql_database 'myapp' do
    connection mysql_connection_info
    action :create
end