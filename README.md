# Salon LeRuby [![Build Status]] [![Dependency Status]]

A Ruby app that creates Stylist and Client classes. Each Stylist or Client object is capable of holding a name and a unique id. Each Stylist object can be connected with an unlimited number Client objects. Each Client object may only be associated with one Stylist object.

## Tests

Testing the Ruby methods and specs can be done through RSpec.

`$ rspec`

## Sinatra App

Viewing the app can be done through Sinatra.

Assuming you have Sinatra installed in the terminal:

`$ ruby app.rb` in the project folder

## Database

All inputted data is saved in the `salon` database.

The `salon` database is comprised of `stylists` and `clients` tables.

The `stylists` table is comprised of `id` and `name` columns.

The `clients` table is comprised of `id`, `name`, and `stylist_id` columns.

## Database Setup
```
CREATE DATABASE salon;
\c salon
CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);
CREATE DATABASE salon_test WITH TEMPLATE salon;
```

## License

MIT License, copyright 2015. 
