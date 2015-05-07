class Book
  attr_reader(:title, :author, :genre, :id)

  define_method(:initialize) do |attributes|
    @title = attributes.fetch(:title)
    @author = attributes.fetch(:author)
    @genre = attributes.fetch(:genre)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_books = DB.exec("SELECT * FROM books;")
    books = []
    returned_books.each do |book|
      title = book.fetch("title")
      author = book.fetch("author")
      genre = book.fetch("genre")
      id = book.fetch("id").to_i
      books.push(Book.new({:title => title, :author => author, :genre => genre, :id => id}))
    end
    books
  end

  define_method(:save) do
    saved_book = DB.exec("INSERT INTO books (title, author, genre) VALUES ('#{@title}', '#{@author}', '#{@genre}') RETURNING id;")
    @id = saved_book.first.fetch("id").to_i()
  end

  define_method(:==) do |other|
    (self.title == other.title) && (self.author == other.author) && (self.genre == other.genre) && (self.id == other.id)
  end

  # define_singleton_method(:find) do |individual|
  #   all_books = Book.all()
  #   found_book = nil
  #   all_books.each() do |book|
  #     if individual == book
  #       found_book = book
  #     end
  #   end
  #   found_book
  # end

  # define_method(:who_has_save) do |patron|
  #   library_transaction = DB.exec("INSERT INTO books_patrons (book_id, patron_id) VALUES ('#{book.id}','#{self.id}');")
  # end
  #
  define_method(:who_has) do
    checked_out_books = DB.exec("SELECT patron_id FROM books_patrons WHERE book_id = #{self.id()};")
    patron_books = []
    patron_id = checked_out_books.first.fetch("patron_id")
    patron_books.push(patron_id.to_i())
    patron_books
  end


  define_singleton_method(:find) do |id|
    result = DB.exec("SELECT * FROM books WHERE id = #{id};")
    title = result.first().fetch("title")
    author = result.first().fetch("author")
    genre = result.first().fetch("genre")
    id = result.first().fetch("id").to_i()
    Book.new({:title => title, :author => author, :genre => genre, :id => id})
  end

  # define_method(:id) do
  #   @id = DB.exec("SELECT id FROM books WHERE title = '#{self.title()}';")
  #
  # end
end
