web: bundle exec rackup config.ru -p $PORT
release: rake db:migrate
release: rake db:seed
web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}