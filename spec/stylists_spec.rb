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


end
