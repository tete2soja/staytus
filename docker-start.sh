#!/bin/bash
cd /opt/staytus

# Configure DB with random password, if not already configured
if [ ! -f /opt/staytus/persisted/database.yml ]; then
  cp config/database.example.yml config/database.yml
  sed -i "s/username:.*/username: $DB_USER/" config/database.yml
  sed -i "s|password:.*|password: $DB_PASSWORD|" config/database.yml
  sed -i "s|host:.*|host: $DB_HOST|" config/database.yml
  sed -i "s|database:.*|database: $DB_DATABASE|" config/database.yml

  bundle exec rake staytus:build staytus:install
  cp config/database.yml /opt/staytus/persisted/database.yml
else
  # Use the previously saved config from the persisted volume
  cp /opt/staytus/persisted/database.yml config/database.yml
  # TODO also copy themes back and forth too

  # If already configured, check if there are any migrations to run
  bundle exec rake staytus:build staytus:upgrade
fi

bundle exec foreman start
