class Stylists

  attr_reader :name, :id

  def initialize (attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id, nil)
  end

  def self.all
    returned_stylists = DB.exec('SELECT * FROM stylists;')
    stylists = []
    returned_stylists.each do |stylist|
      name = stylist.fetch('name')
      id = stylist.fetch('id').to_i
      stylists.push(Clients.new({name: name, id: id}))
    end
    stylists
  end

  def save
    save_stylist = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = save_stylist.first.fetch("id").to_i
  end

  def self.find (id)
    found_stylist = nil
    Stylists.all.each do |stylist|
      if stylist.id == id
        found_stylist = stylist
      end
    end
    found_stylist
  end


end
