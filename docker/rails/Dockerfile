FROM ruby:2.7.1

# dependencies
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update \
    && \
    apt-get install -y \
        build-essential \
        nodejs \
        npm \
    && \
    npm install --global yarn \
    && \
    apt-get clean

# directory
ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# application
ADD ./lunch $APP_HOME
RUN gem install bundler \
	&& \
	bundle install \
	&& \
	yarn install --check-files

# run
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
