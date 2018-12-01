FROM debian:stretch

ARG USERNAME=pub2
ARG USERHOME=/home/pub2
ARG USERID=1000
ARG USERGECOS=Pub2

RUN adduser \
  --home "$USERHOME" \
  --uid $USERID \
  --gecos "$USERGECOS" \
  --disabled-password \
  "$USERNAME"

RUN apt-get update

RUN apt-get install -y \
  texlive-full \
  wget \
  git \
  make \
  pandoc \
  python-pygments \
  sudo \
  curl \
  git-core \
  nodejs \
  zlib1g-dev \
  build-essential \
  libssl-dev \
  libreadline-dev \
  libyaml-dev \
  libsqlite3-dev \
  libxml2-dev \
  libxslt1-dev \
  libcurl4-openssl-dev \
  libffi-dev \
  mysql-client \
  postgresql-client \
  default-libmysqlclient-dev \
  libpq-dev \
  libmagickwand-dev \
  imagemagick \
  virtualenvwrapper \
  python \
  python3 \
  pkg-config \
  python-dev \
  python-pip \
  python3-dev \
  python3-pip \
  fonts-freefont

# Removing documentation packages *after* installing them is kind of hacky,
# but it only adds some overhead while building the image.
RUN \
  apt-get --purge remove -y .\*-doc$ && \
  apt-get clean -y

# Install RVM
RUN curl -sSL https://get.rvm.io | bash -s stable --ruby

# install latest ruby and bundler
ENV RBENV_VERSION 2.5.1
RUN rvm install 2.5.1 && \
  rvm use 2.5.1 && \
  rvm rubygems latest && \
  gem install bundler

# upgrade python pip
RUN pip3 install -U pip

RUN pip3 install -U \
  virtualenv \
  virtualenvwrapper
