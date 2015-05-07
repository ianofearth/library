
require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/book")
require("./lib/patrons")
require("pg")

DB = PG.connect({:dbname => "library"})


get('/') do
  erb(:index)
end

get('/books') do
  @books = Book.all()
  erb(:books)
end

post('/add_book') do
  @title = params.fetch('title')
  @author = params.fetch('author')
  @genre = params.fetch('genre')
  new_book = Book.new({:title => @title, :author => @author, :genre => @genre})
  new_book.save()

  redirect to ('/books')
end

get('/books/:id') do
  @book_id = params.fetch("id").to_i()
  @book = Book.find(book_id)
  # @title = @book.title()
  # @id = DB.exec("SELECT id FROM books WHERE title = '#{@title}';")
erb(:books)

end
