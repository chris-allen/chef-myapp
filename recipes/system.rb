#
# Cookbook Name:: chef-myapp
# Recipe:: system
#
# Copyright (C) 2016 Chris Allen
#
# All rights reserved - Do Not Redistribute
#


include_recipe "apt"
include_recipe "php"
include_recipe "php::module_mysql"

package "git"
package "sendmail"
package "libapache2-mod-php5"