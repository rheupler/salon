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

  describe '#==' do
      it 'is the same client if they have the same name' do
        client1 = Clients.new({name: 'KC Jones'})
        client2 = Clients.new({name: 'KC Jones'})
        expect(client1).to(eq(client2))
      end
    end

  describe '#delete' do
    it 'deletes a client from the database' do
      client1 = Clients.new({name: 'Bill Russell'})
      client1.save
      client2 = Clients.new({name: 'Kobe Bryant'})
      client2.save
      client2.delete
      expect(Clients.all).to eq [client1]
    end
  end

  describe '#update' do
    it 'changes a client in the database' do
      client1 = Clients.new({name: 'Jo Jo White'})
      client1.save
      client1.update({name: 'KC Jones'})
      expect(client1.name).to eq 'KC Jones'
    end
  end
  


end
