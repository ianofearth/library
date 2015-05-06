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
    saved_book = DB.exec("INSERT INTO books (title, author, genre, id) VALUES ('#{@title}', '#{@author}', '#{@genre}', '#{@id}') RETURNING id;")
    @id = saved_book.first.fetch("id").to_i()
  end

  define_method(:==) do |other|
    (self.title == other.title) && (self.author == other.author) && (self.genre == other.genre) && (self.id == other.id)
  end

  define_singleton_method(:find) do |individual|
    all_books = Book.all()
    found_book = nil
    all_books.each() do |book|
      if individual == book
        found_book = book
      end
    end
    found_book
  end


end
