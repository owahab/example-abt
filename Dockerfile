FROM ruby:2.5.3

WORKDIR /var/www

ADD . /var/www

RUN apt-get update -qq && \
    apt-get install -y build-essential && \
    bundle install --jobs 20 --retry 5

EXPOSE 4000

CMD ["bundle", "exec", "guard"]
