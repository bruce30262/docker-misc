FROM jekyll/jekyll:latest
MAINTAINER bruce30262

# locale
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

# clone repo & install 
RUN git clone https://github.com/bruce30262/bruce30262.github.io.git /app
RUN chown -R jekyll /app
RUN cd /app && bundle install && gem install jekyll-admin

# cmd
WORKDIR /app

CMD ["/bin/bash"]
