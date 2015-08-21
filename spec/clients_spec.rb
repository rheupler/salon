require 'spec_helper'

describe Clients do

  describe '.all' do
    it 'empty client list to start' do
      expect(Clients.all).to eq []
    end
  end

  describe '#save' do
    it 'saves a new client into the database' do
      client = Clients.new({name: 'Michael Jordan'})
      client.save
      expect(Clients.all).to eq [client]
    end
  end

  describe '.find' do
    it 'finds a client based on an ID' do
      client1 = Clients.new({name: 'Scotty Pippen'})
      client1.save
      client2 = Clients.new({name: 'Larry Bird'})
      client2.save
      expect(Clients.find(client2.id)).to eq client2
    end
  end
  
end
