# Challenge for Software Engineer

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

## Technology Stack

This application was developed on the following technology stack:

* ruby 1.9.3p194 (2012-04-20 revision 35410) [x86_64-darwin11.4.0]
* bundler 1.2.0.rc
* rails 3.2.7
* PostgreSQL 9.1.3

## Design

### UI

I'm using a simple scaffolded UI where each upload is persisted in a PurchaseFile model. Although not part of the
requirements, I figured that in a real scenario an upload history would be valuable.

### Models

* Item - ActiveRecord model that stores descriptions of purchased items
* Purchaser - ActiveRecord model that stores names of purchasers
* Merchant - ActiveRecord model that stores names and addresses of merchants
* Purchase - ActiveRecord model that represents a transaction and ties together item/purchaser/merchant.
  Corresponds to a row in the purchase file.
* PurchaseFile - ActiveRecord model that persists the name and contents of an uploaded file.
  Invokes the PurchaseFileProcessor upon creation.
* PurchaseFileParser - responsible for parsing the uploaded purchase file. Takes the contents of the file
  as input and returns an array of hashes.
* PurchaseFileProcessor - responsible for persisting data in the Item/Purchaser/Merchant/Purchase models given
  the data in the uploaded file. Persists and logs any validation errors that occur.
* Money - simple helper class responsible for converting between price amounts and cents

### Principles/Discussion

* I strive to adhere to REST and other Rails conventions
* I practice TDD and strive for a high test coverage. Sometimes I will prototype the code first and then rewrite
  it with tests. For this app, due to time constraints, I decided to not build out a full test suite.
* For upgradability and maintainability I keep gem dependencies at a minimum
* I attempt to modularize applications and find a good hierarchy of dependencies. Ideally, infrastructure and business logic
  should not depend on the view/controller layer. One way to ensure such a structure is to break those parts out into libraries.
  An example is that I had uploaded_file as an attribute setter in the model that took an instance of ActionDispatch::Http::UploadedFile
  and extracted the name and contents from it. However, I realized when I was writing the test for the model that this
  created a cross dependency from the model layer to the controller/view layer so I decided to move that logic
  to the controller.
* To avoid any rounding issues with floats I decided to store prices in cents and to clearly communicate this in the
  column names.
* Other design considerations that I am interested in include - programming at an appropriate level of abstraction,
  factoring code into small classes and methods, SRP (cohesion), pure functions (minimizing coupling),
  and clear contracts of functions.

## Demo

The app is deployed to http://peter-data-engineering.herokuapp.com

## Command Line History

Here are some highlights from the command line history when creating and deploying this app.

### App Creation

```
git clone git@github.com:peter/data-engineering.git
rails new data-engineering --skip-bundle --skip-test-unit --database=postgresql
cd data-engineering
rvm --rvmrc --create 1.9.3@data-engineering
gem install bundler --pre
# Added ruby "1.9.3" and rspec-rails to Gemfile
bundle install --binstubs

bin/rails generate rspec:install

createuser data-engineering
rake db:create
```

### UI

```
rm public/index.html
bin/rails generate scaffold PurchaseFile name:string contents:text processing_errors:text
bin/rake db:migrate
```

### ActiveRecord Models for Persisting Uploaded Files

```
bin/rails generate model Purchaser name:string
bin/rails generate model Item description:text
bin/rails generate model Merchant name:string address:text
bin/rails generate model Purchase item_price_in_cents:integer total_price_in_cents:integer item_count:integer item:references purchaser:references merchant:references purchase_file:references
```

### Deployment

```
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
