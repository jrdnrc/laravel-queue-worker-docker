#!/bin/bash

QUEUE=${QUEUE:-default}
CONNECTION=${CONNECTION:-default}
LARAVEL_PATH=${APP:-/var/www}

# Check for install of laravel at $LARAVEL_PATH
if ! [ -e ${LARAVEL_PATH}/artisan ]
then
  echo "Laravel installation not found, exiting"
  exit 45
fi

# Own the app storage areas
chown -R www-data:www-data /var/www/storage

# Create the framework cache dirs
mkdir -p ${LARAVEL_PATH}/storage/app
mkdir -p ${LARAVEL_PATH}/storage/logs
mkdir -p ${LARAVEL_PATH}/storage/framework/sessions
mkdir -p ${LARAVEL_PATH}/storage/framework/views
mkdir -p ${LARAVEL_PATH}/storage/framework/cache
chown -R www-data:www-data ${LARAVEL_PATH}/storage/framework
chown -R www-data:www-data ${LARAVEL_PATH}/storage/logs
chown -R www-data:www-data ${LARAVEL_PATH}/storage/app

# Start the php serve
php ${LARAVEL_PATH}/artisan queue:work ${CONNECTION} --queue=${QUEUE}