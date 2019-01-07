FROM debian:stretch

ARG USERNAME=application
ARG USERHOME=/home/application
ARG USERID=1000
ARG USERGECOS=application

RUN adduser \
  --home "$USERHOME" \
  --uid $USERID \
  --gecos "$USERGECOS" \
  --disabled-password \
  "$USERNAME"

RUN apt-get update && apt-get install -y apt-utils

# install base utilities
RUN apt-get install -y \
  gnupg \
  wget \
  git \
  make \
  sudo \
  curl \
  git-core \
  procps

# install build toolchain
RUN apt-get install -y \
  build-essential \
  zlib1g-dev \
  libssl-dev \
  libreadline-dev \
  libyaml-dev \
  libsqlite3-dev \
  libxml2-dev \
  libxslt1-dev \
  libcurl4-openssl-dev \
  libffi-dev \
  libmagickwand-dev

# install database support
RUN apt-get install -y \
  mysql-client \
  postgresql-client \
  default-libmysqlclient-dev \
  libpq-dev

# install nodejs
RUN apt-get install -y \
  nodejs

# install python
RUN apt-get install -y \
  virtualenvwrapper \
  python \
  python3 \
  pkg-config \
  python-dev \
  python-pip \
  python3-dev \
  python3-pip

# Removing documentation packages *after* installing them is kind of hacky,
# but it only adds some overhead while building the image.
RUN \
  apt-get --purge remove -y .\*-doc$ && \
  apt-get clean -y

# Install RVM
# RUN curl -sSL https://rvm.io/mpapis.asc | gpg --no-tty --verbose --import -
RUN gpg --no-tty --verbose --keyserver hkp://pgp.mit.edu --recv-keys \
  409B6B1796C275462A1703113804BB82D39DC0E3 \
  7D2BAF1CF37B13E2069D6956105BD0E739499BDB

# install latest ruby and bundler
ENV RBENV_VERSION 2.6.0
RUN curl -sSL https://get.rvm.io | bash -s stable --ruby

# rvm install 2.6.0 && \
# rvm use 2.6.0 && \
RUN bash -c "source /usr/local/rvm/scripts/rvm && \
  rvm rubygems latest && \
  gem install bundler"

# upgrade python pip
RUN pip3 install -U pip

RUN pip3 install -U \
  virtualenv \
  virtualenvwrapper
