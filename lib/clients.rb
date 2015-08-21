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
      cleints.push(Clients.new({name: name, id: id}))
    end
    clients
  end

end
