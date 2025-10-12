FROM ruby:3.3.9
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
RUN apt-get update -qq && \
curl -fsSL https://deb.nodesource.com/setup_lts.x |bash - && \
apt-get install -y nodejs build-essential default-libmysqlclient-dev && \
npm install -g yarn
RUN apt-get update -qq && apt-get install -y libvips
WORKDIR /postgres_deploy
RUN gem install bundler:2.6.2
COPY Gemfile /postgres_deploy/Gemfile
COPY Gemfile.lock /postgres_deploy/Gemfile.lock
COPY package.json /postgres_deploy/package.json
RUN bundle install
RUN yarn install
COPY . /postgres_deploy
CMD ["rails", "server", "-b", "0.0.0.0"]