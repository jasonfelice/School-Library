require './book'

class CreateBook
  def create
    puts 'Book Title: '
    title = gets.chomp
    puts 'Book Author: '
    author = gets.chomp
    book = Book.new(title, author)
    puts "'#{title}' by '#{author}' has been successfully added to the book list"
    book
  end
end
