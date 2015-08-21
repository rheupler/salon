require 'sinatra'
require 'sinatra/reloader'
require './lib/stylists'
require './lib/clients'
require 'pg'
require 'pry'
also_reload('lib/**/*.rb')

DB = PG.connect({dbname: 'hair_salon'})

get '/' do
  @stylists = Stylists.all
  @clients = Clients.all
  erb :index
end

post '/stylist/new' do
  name = params.fetch('name')
  stylist = Stylists.new({:name => name})
  stylist.save()
  @stylists = Stylists.all
  erb :success
end

post '/client/new' do
  name = params.fetch('name')
  client = Clients.new({name: name})
  client.save
  @clients = Clients.all()
  erb :success
end

get('/stylist/:id') do
  stylist_id = params.fetch('id').to_i
  @stylist = Stylists.find(stylist_id)
  #display clients needed here when method works
  erb :stylists
end

get('/client/:id') do
  client_id = params.fetch('id').to_i
  @client = Clients.find(client_id)
  erb :clients
end

#editing Clients
get '/client/:id/edit' do
  client_id = params.fetch('id').to_i
  @client = Clients.find(client_id)
  erb :index
end


patch '/client/:id' do
  client_id = params.fetch('id').to_i
  @client = Clients.find(client_id)
  name = params.fetch('name')
  @client.update({name: name})
  erb :edit
end

#Editing Stylists
get '/stylist/:id/edit' do
  stylist_id = params.fetch('id').to_i
  @stylist = Stylists.find(client_id)
  erb :index
end


patch '/stylist/:id' do
  stylist_id = params.fetch('id').to_i
  @stylist = Stylists.find(stylist_id)
  name = params.fetch('name')
  @stylist.update({name: name})
  erb :edit
end

#deleting clients
delete '/client/:id' do
  client_id = params.fetch('id').to_i
  client = Clients.find(client_id)
  client.delete
  @clients = Clients.all()
  erb :delete
end

#deleting stylists
delete '/stylist/:id' do
  stylist_id = params.fetch('id').to_i
  stylist = Stylists.find(stylist_id)
  stylist.delete
  @stylists = Stylists.all()
  erb :delete
end
