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

## Design

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
```
