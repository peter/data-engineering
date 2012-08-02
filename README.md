# Challenge for Software Engineer

## TODO

* Purchase file model tests
* Make tests pass
* Purchase file controller tests
* File upload UI

* Other models

* Bootstrap CSS

* Authentication
* Setup instructions
* Design documentation
* Heroku deploy https://gist.github.com/3025502

## Introduction

This is my implementation of the challenge for "Senior Software Engineer".

## Technology Stack

This application was developed on the following technology stack:

* ruby 1.9.3p194 (2012-04-20 revision 35410) [x86_64-darwin11.4.0]
* bundler 1.2.0.rc
* rails 3.2.7
* PostgreSQL 9.1.3

## Command Line History

```
git clone git@github.com:peter/data-engineering.git
rails new data-engineering --skip-bundle --skip-test-unit --database=postgresql
cd data-engineering
rvm --rvmrc --create 1.9.3@data-engineering
gem install bundler --pre
# Added ruby "1.9.3" and rspec-rails to Gemfile
bundle install --binstubs

# Added this file and removed README.markdown (instructions) and README.rdoc (rails)

bin/rails generate rspec:install

createuser data-engineering
rake db:create

rm public/index.html
bin/rails generate scaffold PurchaseFile name:string contents:text processing_errors:text
bin/rake db:migrate
# Git commit

# Added NOT NULL constraints to purchase_files
# Added root route

# Added PurchaseFile model test

```
