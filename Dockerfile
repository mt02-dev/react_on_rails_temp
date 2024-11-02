
ARG NODE_VERSION=22

FROM ruby:3.2.2
ARG RUBY_VERSION=3.2.2
ARG NODE_VERSION
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
RUN apt-get update -qq \
&& apt-get install -y build-essential npm nodejs
RUN npm install -g yarn
RUN mkdir /app
WORKDIR /app
RUN gem install bundler
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
COPY yarn.lock /app/yarn.lock
RUN bundle install
RUN yarn install
COPY . /app