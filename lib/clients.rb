class Clients

  attr_reader :name, :id, :stylist_id

  def initialize (attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id, nil)
    @stylist_id = attributes.fetch(:stylist_id, nil)
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

  def == (another_client)
    self.id == another_client.id
  end

  def self.find (id)
    found_client = nil
    Clients.all.each do |client|
      if client.id == id
        found_client = client
      end
    end
    found_client
  end

  def delete
    DB.exec("DELETE FROM clients * WHERE id = #{@id};")
    #I think I will need to come nack and add a delete from join table here as well? But for now it passes Clients spec.
  end

  def update (attributes)
    @name = attributes.fetch(:name, @name)
    DB.exec("UPDATE clients SET name = '#{name}' WHERE id = #{@id}")
    #do I need to update id as well?
  end

end
