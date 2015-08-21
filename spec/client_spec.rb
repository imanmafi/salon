require "spec_helper"

describe(Client) do
  describe(".all") do
    it("starts with no clients") do
      expect(Client.all).to eq([])
    end
  end

  describe("#name") do
    it("returns the name of the client") do
      client = Client.new({:name => "Lauren Johnson", :id => nil, :stylist_id => 1})
      expect(client.name).to eq("Lauren Johnson")
    end
  end

  describe("#id") do
    it("sets the client id upon saving") do
      client = Client.new({:name => "Lauren Johnson", :id => nil, :stylist_id => 1})
      client.save
      expect(client.id).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#stylist_id") do
    it("returns the stylist_id associated with each client") do
      client = Client.new({:name => "Lauren Johnson", :id => nil, :stylist_id => 1})
      client.save
      expect(client.stylist_id).to eq(1)
    end
  end      

  describe("#save") do
    it("saves a client to the database") do
      client = Client.new({:name => "Lauren Johnson", :id => nil, :stylist_id => 1})
      client.save
      expect(Client.all).to eq([client])
    end
  end

  describe("#==") do
    it("is the same client if he or she has the same name") do
      client = Client.new({:name => "Lauren Johnson", :id => nil, :stylist_id => 1})
      client2 = Client.new({:name => "Lauren Johnson", :id => nil, :stylist_id => 1})
      expect(client).to eq(client2)
    end
  end
end