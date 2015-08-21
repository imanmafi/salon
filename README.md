# Salon LeRuby

A Ruby app that creates Stylist and Client classes. Each Stylist or Client object is capable of holding a name and a unique id. Each Stylist object can be connected with an unlimited number Client objects. Each Client object may only be associated with one Stylist object.

## Code Example
```
Assuming that you have Ruby installed in the terminal:

`test_stylist = Stylist.new("Michelle")`

`test_client = Client.new("Sara")`

`test_stylist.update("Mary")` => updates stylist name

`test_stylist.delete` => deletes stylist and corresponding clients from the database
```
## Tests

Testing the Ruby methods and specs can be done through RSpec.

`rspec`

## Sinatra App

Viewing the app can be done through Sinatra.

Assuming you have Sinatra installed in the terminal:

`ruby app.rb` in the project folder

## Database

All inputted data is saved in the `salon` database.

The `salon` database is comprised of `stylists` and `clients` tables.

The `stylists` table is comprised of `id` and `name` columns.

The `clients` table is comprised of `id`, `name`, and `stylist_id` columns.

## Database Setup
```
CREATE DATABASE salon;
\c hair_salon
CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);
CREATE DATABASE salon_test WITH TEMPLATE salon;
```

## License

MIT License, copyright 2015. 
```
