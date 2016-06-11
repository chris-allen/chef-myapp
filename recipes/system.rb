#
# Cookbook Name:: chef-myapp
# Recipe:: system
#
# Copyright (C) 2016 Chris Allen
#
# All rights reserved - Do Not Redistribute
#


execute "apt-get update" do
  action :nothing
end.run_action(:run)
include_recipe "php"
include_recipe "php::module_mysql"

package "git"
package "sendmail"