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

  def == (another_stylist)
    self.id == another_stylist.id
  end

  def delete
    DB.exec("DELETE FROM stylists * WHERE id = #{@id}")
    #same as clients, think I need to fit in a delete for a join table called stylists_clients
  end

  def update (attributes)
    @name = attributes.fetch(:name, @name)
    DB.exec("UPDATE stylists SET name = '#{name}' WHERE id = #{@id}")
    #do I need to update id as well?
  end


#NEED TO FIX THIS, BOTTOM METHOD IS EX. FROM HW. TAKE A LOOK AFTER I GET EVERYTHING ELSE GOING.

  # def clients
  #   list_clients = []
  #   clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id}")
  #   clients.each do |clients|
  #     list_id = clients.fetch('client_id').to_i
  #     name = clients.fetch('name')
  #     list_clients.push(Clients.new({name: name, list_id: list_id}))
  #   end
  #   list_clients
  # end

 #  define_method(:tasks) do
 #   list_tasks = []
 #   tasks = DB.exec("SELECT * FROM tasks WHERE list_id = #{self.id()};")
 #   tasks.each() do |task|
 #     description = task.fetch("description")
 #     list_id = task.fetch("list_id").to_i()
 #     list_tasks.push(Task.new({:description => description, :list_id => list_id}))
 #   end
 #   list_tasks
 # end

end
