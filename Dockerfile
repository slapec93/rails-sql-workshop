FROM bitriseio/website-docker-base-env

RUN apt-get update -qq
RUN apt-get install -y openssh-client
RUN apt-get install -y git

RUN mkdir /app

WORKDIR /app
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN gem install bundler && bundle install --full-index --jobs 20 --retry 5

COPY . /app
