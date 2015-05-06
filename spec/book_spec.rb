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
      expect(Books.all()).to(eq([]))
    end
  end
end


      # test_book = Book.new({:title => "Grapes of Wrath", :author => "John Steinbeck", :genre => "historical fiction", :id => nil})
      #
