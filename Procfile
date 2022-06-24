web: bundle exec rackup config.ru -p $PORT
release: bundle exec rake db:reset
release: bundle exec rake db:migrate
release: bundle exec rake db:seed