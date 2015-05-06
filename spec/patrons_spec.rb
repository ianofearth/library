require("rspec")
require("pg")
require("patrons")

DB = PG.connect({:dbname => "library_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM patrons *;")
  end
end


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

  describe('.all') do
    it('returns list of all patrons') do
      expect(Patron.all()).to(eq([]))
    end
  end

  describe('#==') do
    it('recognizes two entries are the same') do
      test_patron = Patron.new({:name => "courtney", :id => 1})
      test_patron2 = Patron.new({:name => "courtney", :id => 1})
      expect(test_patron).to(eq(test_patron2))
    end
  end

end
