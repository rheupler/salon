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

end
