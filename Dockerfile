FROM ruby:3.1.2

# Rails app lives here
WORKDIR /app

# Install packages needed to build gems
RUN apt-get update -qq && \
    apt-get install -y \
			build-essential \
			git \
			g++ \
			make \
			libpq-dev \
			npm \
			nodejs
RUN npm install -g yarn

# Install application gems
COPY Gemfile /app/Gemfile 
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

COPY package.json /app/package.json
COPY yarn.lock /app/yarn.lock

# Copy application code
COPY . /app 