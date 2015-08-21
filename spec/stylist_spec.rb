require("spec_helper")

describe(Stylist) do
  describe(".all") do
    it("starts with no stylists") do
      expect(Stylist.all).to eq([])
    end
  end

  describe(".find") do
    it("finds the stylist by his or her id") do
      stylist = Stylist.new({:name => "Marta Molnar", :id => nil})
      stylist.save
      stylist2 = Stylist.new({:name => "April Kennedy", :id => nil})
      stylist2.save
      expect(Stylist.find(stylist2.id)).to eq(stylist2)
    end
  end

  describe("#name") do
    it("returns the name of the stylist") do
      stylist = Stylist.new({:name => "Marta Molnar", :id => nil})
      expect(stylist.name).to eq("Marta Molnar")
    end
  end

  describe("#id") do
    it("sets the stylist id upon saving") do
      stylist = Stylist.new({:name => "Marta Molnar", :id => nil})
      stylist.save
      expect(stylist.id).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("saves a stylist to the database") do
      stylist = Stylist.new({:name => "Marta Molnar", :id => nil})
      stylist.save
      expect(Stylist.all).to eq([stylist])
    end
  end

  describe("#==") do
    it("is the same stylist if he or she has the same name") do
      stylist = Stylist.new({:name => "Marta Molnar", :id => nil})
      stylist2 = Stylist.new({:name => "Marta Molnar", :id => nil})
      expect(stylist).to eq(stylist2)
    end
  end

  describe("#clients") do
    it("returns an array of clients who see a particular stylist") do
      stylist = Stylist.new({:name => "Marta Molnar", :id => nil})
      stylist.save
      client = Client.new({:name => "Lauren Johnson", :id => nil, :stylist_id => stylist.id})
      client.save
      client2 = Client.new({:name => "Aubrey Smith", :id => nil, :stylist_id => stylist.id})
      client2.save
      expect(stylist.clients).to eq([client, client2])
    end
  end

  describe("#update") do
    it("updates the stylist name in the database") do
      stylist = Stylist.new({:name => "Marta Molnar", :id => nil})
      stylist.save
      stylist.update({:name => "Radoslav Slivovic"})
      expect(stylist.name).to eq("Radoslav Slivovic")
    end
  end

  describe("#delete") do
    it("lets you delete a stylist from the database") do
      stylist = Stylist.new({:name => "Marta Molnar", :id => nil})
      stylist.save
      stylist2 = Stylist.new({:name => "Radoslav Slivovic", :id => nil})
      stylist2.save
      stylist.delete
      expect(Stylist.all).to eq([stylist2])
    end

    it("lets you delete a stylist's clients from the database") do
      stylist = Stylist.new({:name => "Marta Molnar", :id => nil})
      stylist.save
      client = Client.new({:name => "Lauren Johnson", :id => nil, :stylist_id => stylist.id})
      client.save
      client2 = Client.new({:name => "Aubrey Smith", :id => nil, :stylist_id => stylist.id})
      client2.save
      stylist.delete
      expect(Client.all).to eq([])
    end
  end
end