class Clients

  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id, nil)
  end

  def self.all
    returned_clients = DB.exec('SELECT * FROM clients;')
    clients = []
    returned_clients.each do |client|
      name = client.fetch('name')
      id = client.fetch('id').to_i
      clients.push(Clients.new({name: name, id: id}))
    end
    clients
  end

  def save
    save_client = DB.exec("INSERT INTO clients (name) VALUES ('#{@name}') RETURNING id;")
    @id = save_client.first.fetch("id").to_i
  end

  def ==(another_client)
    self.id == another_client.id
  end
  
end
