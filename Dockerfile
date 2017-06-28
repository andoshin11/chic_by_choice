FROM andoshin11/rails_base:1.0
RUN apt-get update -qq && \
    apt-get install -y apt-utils \
                       libpq-dev \
                       mysql-client \
                       libsqlite3-dev \
                       libmysql++-dev
RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN gem install bundler
RUN bundle install
ADD . /app

EXPOSE 3000
