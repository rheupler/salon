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
  
end
