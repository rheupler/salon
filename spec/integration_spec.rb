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


describe '/clients/', {:type => :feature} do
  it 'displays index page with clients' do
    visit('/')
    fill_in "client_name", with: "John Havlicek"
    click_button "Go"
    click_link "Back to your Lists"
    expect(page).to have_content("John Havlicek")
    visit('/')
    expect(page).to have_content("John Havlicek")
  end
end

describe '/stylists/', {:type => :feature} do
  it 'displays index page with stylists' do
    visit('/')
    fill_in "stylist_name", with: "Paul Pierce"
    click_button "submit"
    click_link "Back to your Lists"
    expect(page).to have_content("Paul Pierce")
    visit('/')
    expect(page).to have_content("Paul Pierce")
  end
end
