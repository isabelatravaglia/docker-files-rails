# docker-files-rails
Docker files for new Rails app.
Based on instructions from https://docs.docker.com/compose/rails/ .

After placing all the files in a directory, do the following:

docker-compose run --no-deps web rails new . --force --database=postgresql
docker-compose build (refresh build for the new Gemfile)
Replace the contents of config/database.yml with the following:
##########################################################
default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password: password
##########################################################

docker-compose run web rails db:create
docker-compose up
