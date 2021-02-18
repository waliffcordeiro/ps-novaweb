ARG NODE_VERSION=latest
ARG RUBY_VERSION=latest
ARG YARN_VERSION=latest

#Node.js & Yarn
FROM node:$NODE_VERSION as node

RUN apk add --no-cache bash curl && \
  curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version $YARN_VERSION

#Ruby & Bundler & postgresql-client
FROM ruby:$RUBY_VERSION

COPY --from=node /usr/local/bin/node /usr/local/bin/node
COPY --from=node /opt/yarn-* /opt/yarn
RUN ln -fs /opt/yarn/bin/yarn /usr/local/bin/yarn

ENV ROOT=/app

WORKDIR ${ROOT}

# Packages
RUN apk update && \
  apk upgrade && \
  apk add --no-cache \
  gcc \
  g++ \
  libc-dev \
  libxml2-dev \
  linux-headers \
  make \
  postgresql \
  postgresql-dev \
  tzdata \
  less \
  git && \
  apk add --virtual build-packs --no-cache \
  build-base \
  curl-dev

COPY Gemfile ${ROOT}
COPY Gemfile.lock ${ROOT}

RUN bundle install -j4 && \
  apk del build-packs

COPY . ${ROOT}