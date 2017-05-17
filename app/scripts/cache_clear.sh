#/bin/sh
php -d memory_limit=1024M app/console cache:clear --env=dev
php -d memory_limit=1024M app/console cache:clear --env=prod
