#!/bin/bash

QUEUE=${QUEUE:-default}
CONNECTION=${CONNECTION:-default}

# Check for install of laravel at /var/www
if ! [ -e /var/www/artisan ]
then
  echo "Laravel installation not found, exiting"
  exit 45
fi

# Own the app storage areas
chown -R www-data:www-data /var/www/storage

# Create the framework cache dirs
mkdir -p /var/www/storage/app
mkdir -p /var/www/storage/logs
mkdir -p /var/www/storage/framework/sessions
mkdir -p /var/www/storage/framework/views
mkdir -p /var/www/storage/framework/cache
chown -R www-data:www-data /var/www/storage/framework
chown -R www-data:www-data /var/www/storage/logs
chown -R www-data:www-data /var/www/storage/app

# Start the php serve
php /var/www/artisan queue:work ${CONNECTION} --queue=${QUEUE}