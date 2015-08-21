require("rspec")
require("pg")
require("stylists")
require("clients")

DB = PG.connect({:dbname => "salon_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stylists *;")
    DB.exec("DELETE FROM clients *;")
  end
end
