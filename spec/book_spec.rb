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

   describe('#who_has') do
     it('returns which patrons, if any, have checked out a book') do
       test_patron = Patron.new({:name => "Spiderman", :id => 50})
       test_patron.save()
       test_book2 = Book.new({:title => "Where the Wild Things Are", :author => "Maurice Sendak", :genre => "childrens fiction", :id => 2})
       test_book2.save()
       test_patron.checked_out_save(test_book2)
       expect(test_book2.who_has()).to(eq([test_patron.id()]))
     end
   end

end
