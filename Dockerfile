FROM ruby:2.7.1

# dependencies
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update
RUN apt-get install -y \
    build-essential \
    nodejs \
    npm
RUN npm install --global yarn

# directory
ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# ruby gems
RUN gem install bundler
ADD ./lunch/Gemfile* $APP_HOME/
RUN bundle install

# application
ADD ./lunch $APP_HOME
RUN yarn install --check-files

# uncover port
EXPOSE 80

# run
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "80"]
