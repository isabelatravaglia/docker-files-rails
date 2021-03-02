#!/bin/bash
set -e

echo "Entrypoint is here"

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# bundle exec rails db:prepare
# bundle exec rails assets:precompile
# bundle exec rails s -b 0.0.0.0
exec "$@"