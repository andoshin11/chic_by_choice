FROM andoshin11/rails_base
RUN apt-get update -qq && \
    apt-get install -y apt-utils \
                       libpq-dev \
                       mysql-client
RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install -j4
ADD . /app

EXPOSE 3000
