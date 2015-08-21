# _Hair Salon Database_

##### an application that allows a user to add clients and stylists to a hair salon database and add clients to stylists August 21, 2015

### By _**Mike Bunker**_

## This application lets a user add clients and stylists to a database and add, edit, and drop them. It also allows for stylists to be given clients.

## Ruby, HTML, CSS, Sinatra, Postgres and SQL were used to create and launch this application.

## Local Setup
 * Clone this repository to your local system.
 * install Sinatra $gem install Sinatra
 * In PSQL:
 * CREATE DATABASE hair_salon;
 * CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
 * CREATE TABLE clients (id serial PRIMARY KEY, name varchar);
 * CREATE TABLE stylists_clients (id serial PRIMARY KEY, stylist_id int, client_id int)
 * run app file $ruby app.rb
 * open localhost:4567 in preferred web browser.


### Legal Copyright (c) 2015 _**Mike Bunker**_

This software is licensed under the MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

The software is provided "AS IS", without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement. In no event shall the authors or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the software.
