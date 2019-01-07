FROM iandennismiller/latex

RUN apt-get update && apt-get install -y apt-utils

RUN bash -c "source /usr/local/rvm/scripts/rvm && \
  gem install jekyll && \
  gem install jekyll-sitemap"

RUN pip3 install -U mr.bob pub2==0.1.6

# upgrade pandoc
RUN wget https://github.com/jgm/pandoc/releases/download/2.5/pandoc-2.5-1-amd64.deb
RUN dpkg -i pandoc-2.5-1-amd64.deb
