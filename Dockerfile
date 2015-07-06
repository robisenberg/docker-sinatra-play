FROM ruby:2.2.0
MAINTAINER Rob Isenberg, robisenberg@me.com

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    # nodejs \
    # npm \
    # nodejs-legacy \
    mysql-client \
    # libxml2-dev \       # for Nokogiri
    # libxslt1-dev \      # ""
    vim

# RUN npm install -g phantomjs # for JS tests

RUN mkdir /myapp

# skip bundle install if Gemfile hasn't changed
# see: http://ilikestuffblog.com/2014/01/06/how-to-skip-bundle-install-when-deploying-a-rails-app-to-docker/
WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install


# add the local files to the container
ADD . /myapp

# switch to the app folder inside container
WORKDIR /myapp

EXPOSE 9292
CMD ["bundle", "exec", "rackup", "-o", "0.0.0.0"]