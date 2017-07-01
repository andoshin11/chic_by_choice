FROM andoshin11/rails_base:1.0
RUN apt-get update -qq && \
    apt-get install -y libpq-dev \
                       mysql-client \
                       libsqlite3-dev \
                       libmysql++-dev

RUN gem install bundler
RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install
ADD . /app
RUN npm install

EXPOSE 3000
