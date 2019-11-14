FROM treyedocker/ubuntu_node_12_ruby_2_6_3_chromedriver:latest

# Configure bundler and PATH
ENV LANG=C.UTF-8 \
  GEM_HOME=/bundle \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3
ENV BUNDLE_PATH $GEM_HOME
ENV BUNDLE_APP_CONFIG=$BUNDLE_PATH \
  BUNDLE_BIN=$BUNDLE_PATH/bin
ENV PATH /app/bin:$BUNDLE_BIN:$PATH

RUN mkdir -p tmp/pids

# Create a directory for the app code
RUN mkdir -p /app

WORKDIR /app

# Setting env up
ENV RAILS_ENV='development'
ENV NODE_ENV='development'

# Adding gems
COPY ./.docker/test/app/mongoid.yml config/mongoid.yml
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
COPY package.json package.json
COPY yarn.lock yarn.lock

RUN bundle install && yarn install --check-files