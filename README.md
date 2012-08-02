# Challenge for Software Engineer

## TODO

* Design documentation
* Authentication?

## Introduction

This is my implementation of the challenge for "Senior Software Engineer".
More about me at http://marklunds.com/peter/cv

## Setup Instructions

* Make sure you have Ruby 1.9.3 installed. Ruby 1.9.2 should work fine too but the 1.9.3 dependency is specified in
  Gemfile so you need to change that if you are using a different Ruby version.
* Get the latest bundler with "gem install bundler --pre"
* Checkout the source code, install dependencies, load the schema, run the tests, and start the server:

```
git clone git@github.com:peter/data-engineering.git
cd data-engineering

# If you prefer sqlite over Postgresql:
# cp config/database.sqlite.yml config/database.yml
# Add gem 'sqlite3' to Gemfile

bundle install --binstubs

bin/rake db:migrate
bin/rake
bin/rails s
```

## Deployment

The app is deployed to http://peter-data-engineering.herokuapp.com

## Technology Stack

This application was developed on the following technology stack:

* ruby 1.9.3p194 (2012-04-20 revision 35410) [x86_64-darwin11.4.0]
* bundler 1.2.0.rc
* rails 3.2.7
* PostgreSQL 9.1.3

## Discussion Points

* I had uploaded_file as an attribute setter in the model that took an instance of ActionDispatch::Http::UploadedFile
  and extracted the name and contents from it. However, I realized when I was writing the test for the model that this
  created a cross dependency from the model layer to the controller/view layer so I decided to move that logic
  to the controller.

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

# -- git commit ---

# Added NOT NULL constraints to purchase_files
# Added root route

# Added PurchaseFile model test

# -- git commit ---

# Implemented basic file upload UI

# -- git commit ---

bin/rails generate model Purchaser name:string
bin/rails generate model Item description:text
bin/rails generate model Merchant name:string address:text
bin/rails generate model Purchase item_price_in_cents:integer total_price_in_cents:integer item_count:integer item:references purchaser:references merchant:references purchase_file:references

# Added purchase file parsing/processing code

# -- git commit ---

# Add gem 'thin' to Gemfile # Typical web server for Heroku deploy
bundle install
echo "web: bundle exec rails server thin -p \$PORT -e \$RACK_ENV" > Procfile
heroku apps:create peter-data-engineering
git push heroku master
heroku run rake db:migrate
heroku restart
heroku apps:open
heroku logs --tail
```
