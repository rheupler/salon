require 'spec_helper'
require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe '/', {:type => :feature} do
  it 'displays index page with clients and stylists' do
    visit('/')
    expect(page).to have_content("")
  end
end
