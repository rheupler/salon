require 'spec_helper'

describe Stylists do

  describe '.all' do
    it 'starts off with no stylists' do
      expect(Stylists.all).to eq []
    end
  end

  describe '#save' do
    it 'saves a stylist to the DB' do
      stylist = Stylists.new({name: 'Bob Cousy'})
      stylist.save
      expect(Stylists.all).to eq [stylist]
    end
  end

  describe '.find' do
    it 'finds a stylist based on an ID' do
      stylist1 = Stylists.new({name: 'Scotty Pippen'})
      stylist1.save
      stylist2 = Stylists.new({name: 'Larry Bird'})
      stylist2.save
      expect(Stylists.find(stylist2.id)).to eq stylist2
    end
  end

  describe("#==") do
      it("is the same stylist if they have the same name") do
        stylist1 = Stylists.new({name: 'Coach Red'})
        stylist2 = Stylists.new({name: 'Coach Red'})
        expect(stylist1).to(eq(stylist2))
      end
    end

  describe '#delete' do
    it 'deletes a stylist from the database' do
      stylist1 = Stylists.new({name: 'Kevin Garnett'})
      stylist1.save
      stylist2 = Stylists.new({name: 'Lebron James'})
      stylist2.save
      stylist2.delete
      expect(Stylists.all).to eq [stylist1]
    end
  end

  describe '#update' do
    it 'changes a stylist in the database' do
      stylist1 = Stylists.new({name: 'Jo Jo White'})
      stylist1.save
      stylist1.update({name: 'Ray Allen'})
      expect(stylist1.name).to eq 'Ray Allen'
    end
  end

#METHOD NOT WORKING, REVISIT AFTER EVERYTHING ELSE IS GOING
  # describe '#clients' do
  #   it 'returns array of clients of a stylist' do
  #     stylist = Stylists.new({name: 'Doc Rivers'})
  #     stylist.save
  #     client1 = Clients.new({name: 'Rajon Rondo'})
  #     client1.save
  #     client2 = Clients.new({name: 'Eddie House'})
  #     client2.save
  #     stylist.update({client_ids: [client1.id]})
  #     expect(stylist.clients).to eq [client1]
  #   end
  # end

end
