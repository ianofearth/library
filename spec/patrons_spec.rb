require("rspec")
require("pg")
require("patrons")

describe(Patron) do

  describe('#name') do
    it('returns the name of a given patron') do
      test_patron = Patron.new({:name => "Courtney", :id => nil})
      expect(test_patron.name()).to(eq("Courtney"))
    end
  end

  describe('#id') do
    it('returns the patron id of a given patron') do
      test_patron = Patron.new({:name => "courtney", :id => 1})
      expect(test_patron.id()).to(eq(1))
    end
  end

end
