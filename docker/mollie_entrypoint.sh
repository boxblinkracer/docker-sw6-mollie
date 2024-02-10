#!/bin/bash

set -e

source /etc/apache2/envvars
source /var/www/.bashrc

export BASH_ENV=/var/www/.bashrc


if [ $MOLLIE_API_KEY != 'not-set' ]; then
  sudo service mysql start;
  cd /var/www/html && php bin/console --no-debug system:config:set MolliePayments.config.testApiKey "$MOLLIE_API_KEY"
  sudo service mysql stop;
fi

exec "$@"
