class Client
	attr_reader(:name, :id, :stylist_id)

	def initialize (attributes)
		@name = attributes.fetch(:name)
		@id = attributes.fetch(:id)
		@stylist_id = attributes.fetch(:stylist_id)
	end

	def save
    result = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', #{@stylist_id}) RETURNING id;")
    @id = result.first.fetch("id").to_i
  	end

  	def self.all
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each do |client|
      name = client.fetch("name")
      id = client.fetch("id").to_i
      stylist_id = client.fetch("stylist_id").to_i
      clients.push(Client.new({:name => name, :id => id, :stylist_id => stylist_id}))
    	end
    clients
  	end

  	def == (another_client)
    	self.name.==(another_client.name).&(self.id.==(another_client.id)).&(self.stylist_id.==(another_client.stylist_id))
  	end
end