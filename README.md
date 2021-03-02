# docker-files-rails
Docker files for new Rails app.<br />
Based on instructions from https://docs.docker.com/compose/rails/ .<br />
Differences:<br />
1- Instead of manually changing the files' ownership, the Dockerfile creates a user based in the current user and changes files' ownership accordingly (and also executes some of the commands as that user). This also prevents that rails commands such as 'rails generate controller' creates files as root.<br />
2- The DB volume is mounted differently (without referring to ./tmp/db) to avoid permission issues when rebuilding the image.<br />
3- Base image is different and there are different dependencies.<br />

After placing all the files in a directory, do the following:

docker-compose run --no-deps web rails new . --force --database=postgresql

docker-compose build (refresh build for the new Gemfile)

Replace the contents of config/database.yml with the following:

##########################################################<br />
default: &default<br />
  adapter: postgresql<br />
  encoding: unicode<br />
  host: db<br />
  username: postgres<br />
  password: password<br />
##########################################################

docker-compose run web rails db:create

docker-compose up
