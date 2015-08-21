require 'spec_helper'

describe Stylists do

  describe '.all' do
    it 'starts off with no stylists' do
      expect(Stylists.all).to eq []
    end
  end

end
