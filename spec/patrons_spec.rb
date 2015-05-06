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

end
