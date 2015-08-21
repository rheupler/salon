require 'spec_helper'

describe Clients do

  describe '.all' do
    it 'empty client list to start' do
      expect(Clients.all).to eq []
    end
  end

end
