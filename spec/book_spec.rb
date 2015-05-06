require('spec_helper')

describe(Book) do

  describe('#title') do
    it('returns a books title') do
      test_book = Book.new({:title => "Grapes of Wrath", :author => "John Steinbeck", :genre => "historical fiction", :id => nil})
      expect(test_book.title()).to(eq("Grapes of Wrath"))
    end
  end

  describe('#author') do
    it('returns a books author') do
      test_book = Book.new({:title => "Grapes of Wrath", :author => "John Steinbeck", :genre => "historical fiction", :id => nil})
      expect(test_book.author()).to(eq("John Steinbeck"))
    end
  end

  describe('#genre') do
    it('returns a books genre') do
      test_book = Book.new({:title => "Grapes of Wrath", :author => "John Steinbeck", :genre => "historical fiction", :id => nil})
      expect(test_book.genre()).to(eq("historical fiction"))
    end
  end

  describe('#id') do
    it('returns a books id') do
      test_book = Book.new({:title => "Grapes of Wrath", :author => "John Steinbeck", :genre => "historical fiction", :id => 1})
      expect(test_book.id()).to(eq(1))
    end
  end



  describe('.all') do
    it('returns a list of all books') do
      expect(Book.all()).to(eq([]))
    end
  end

   describe('#save') do
     it('will save book information to the database') do
       test_book = Book.new({:title => "Grapes of Wrath", :author => "John Steinbeck", :genre => "historical fiction", :id => 1})
       test_book.save()
       expect(Book.all()).to(eq([test_book]))
     end
   end

   describe('#==') do
     it('recognizes two entries are the same') do
       test_book = Book.new({:title => "Grapes of Wrath", :author => "John Steinbeck", :genre => "historical fiction", :id => nil})
       test_book2 = Book.new({:title => "Grapes of Wrath", :author => "John Steinbeck", :genre => "historical fiction", :id => nil})
       expect(test_book).to(eq(test_book2))
     end
   end

   describe('.find') do
     it('locates a specific book within the class of all books') do
       test_book = Book.new({:title => "Grapes of Wrath", :author => "John Steinbeck", :genre => "historical fiction", :id => 1})
       test_book.save()
       expect(Book.find(test_book)).to(eq(test_book))
     end
   end

  #  describe('#borrow') do
  #    it('connects the patron and book in join table, creating record of patron borrowing book') do
  #      test_book = Book.new({:title => "Grapes of Wrath", :author => "John Steinbeck", :genre => "historical fiction", :id => 1})
  #      test_patron = Patron.new({:name => "courtney", :id => 1})
  #      test_book.borrow(test_patron)
  #

end


      # test_book = Book.new({:title => "Grapes of Wrath", :author => "John Steinbeck", :genre => "historical fiction", :id => nil})
      #

      #  describe('#checkout') do
      #    it('will associate a checkut date with a book') do
