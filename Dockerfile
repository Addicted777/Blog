FROM ruby:3.2.2-slim

# Installation of dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN apt-get -y install build-essential
RUN apt-get -y install libpq-dev
RUN apt-get -y install imagemagick
RUN apt-get -y install libcurl4-openssl-dev
RUN apt-get -y install xvfb libxi6 libgconf-2-4

RUN apt-get clean autoclean \
  && apt-get autoremove -y \
  && rm -rf \
  /var/lib/apt \
  /var/lib/dpkg/* \
  /var/lib/cache \
  /var/lib/log

WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle config build.nokogiri --use-system-libraries
RUN bundle check || bundle install 

RUN bundle install

#For nodejs and frontend files#
#COPY package.json yarn.lock ./
#RUN yarn install --check-files

COPY . ./

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]