#FROM ubuntu:22.04
FROM ruby:latest

COPY Gemfile .

RUN apt update
#RUN apt install -y ruby ruby-bundler
#RUN apt install -y ruby-dev build-essential libmariadb-dev
RUN apt install -y build-essential libmariadb-dev
RUN bundle install
