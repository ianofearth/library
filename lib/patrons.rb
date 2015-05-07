class Patron
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_patrons = DB.exec("SELECT * FROM patrons;")
    patrons = []
    returned_patrons.each() do |patron|
      name = patron.fetch("name")
      id = patron.fetch("id").to_i
      patrons.push(Patron.new({:name => name, :id => id}))
    end
    patrons
  end

  define_method(:==) do |other|
    (self.name == other.name) && (self.id == other.id)
  end

  define_method(:save) do
    saved_patron = DB.exec("INSERT INTO patrons (name, id) VALUES ('#{name}', '#{id}') RETURNING id;")
    @id = saved_patron.first.fetch("id").to_i()
  end

  define_singleton_method(:find) do |individual|
    all_patrons = Patron.all()
    found_patron = nil
    all_patrons.each() do |patron|
      if individual == patron
        found_patron = patron
      end
    end
    found_patron
  end

  define_method(:checked_out_save) do |book|
    library_transaction = DB.exec("INSERT INTO books_patrons (book_id, patron_id) VALUES ('#{book.id}','#{self.id}');")
  end

  define_method(:checked_out) do
    patron_books = DB.exec("SELECT book_id FROM books_patrons WHERE patron_id = #{self.id()};")
    checked_out_books = []
    book_id = patron_books.first.fetch("book_id")
    checked_out_books.push(book_id.to_i())
  checked_out_books
  end
end
