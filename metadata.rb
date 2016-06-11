name             'chef-myapp'
maintainer       'Chris Allen'
maintainer_email 'chris@apaxsoftware.com'
license          'All rights reserved'
description      'Installs/Configures chef-myapp'
long_description 'Installs/Configures chef-myapp'
version          '0.1.0'

depends "apt"
depends "php"
depends "apache2"
depends "mysql2_chef_gem"
depends "database"