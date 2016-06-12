# chef-myapp

This cookbook is designed for use in both production and development environments.  It can be used locally leveraging the Berkshelf vagrant plugin and on AWS using an OpsWorks stack.

## Recipes

### system
This recipe installs all system-level dependencies.

### server
This recipe installs and configures `apache2`.

### code
This recipe fetches the source of the application and configures the application based on environment variables set by the OpsWorks application.  _It is intended to be run only on OpsWorks._

### dev_database
This recipe simply installs MySQL and creates a database with hardcoded credentials.  It is intended for development purposes only.

### wordpress
This recipe assumes the application source exists and sets up the uploads directory.

## License and Authors
Copyright (C) APAX Software Development, LLC - All Rights Reserved

Unauthorized copying of this file, via any medium is strictly prohibited

Proprietary and confidential

Written by Chris Allen <chris@apaxsoftware.com>, June 2016
