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