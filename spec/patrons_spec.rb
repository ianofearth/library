require("spec_helper")
# require("rspec")
# require("pg")
# require("patrons")

# DB = PG.connect({:dbname => "library_test"})
#
# RSpec.configure do |config|
#   config.after(:each) do
#     DB.exec("DELETE FROM patrons *;")
#   end
# end

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

  describe('#save') do
    it('saves a patron to database for future recall') do
      test_patron = Patron.new({:name => "ian", :id => 2})
      test_patron.save()
      expect(Patron.all).to(eq([test_patron]))
    end
  end

  describe('.find') do
    it('locates a specific patron within the class of all patrons') do
      test_patron = Patron.new({:name => "Spiderman", :id => 50})
      test_patron.save()
      expect(Patron.find(test_patron)).to(eq(test_patron))
    end
  end

  describe('#checked_out_save') do   ####this may be useless
    it('will save a patrons information in the database') do
      test_patron = Patron.new({:name => "Spiderman", :id => 50})
      test_patron.save()
      expect(test_patron.checked_out_save()).to(eq(50))
    end
  end


  # describe('#checked_out') do
  #   it('returns which books, if any, a patron has checked out. is empty at first?') do
  #     test_patron = Patron.new({:name => "Spiderman", :id => 50})
  #     expect(test_patron.checked_out()).to(eq([]))
  #   end
  # end

end
