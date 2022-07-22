require './teacher'
require './student'
require './book'
require './rental'

class App
  def initialize
    @rentals = []
    @books = []
    @people = []
  end

  def run
    puts 'Welcome to the School Library!'
    until list_options
      input = gets.chomp
      if input == '7'
        puts 'Have good day :)'
        break
      end
      option(input)
    end
  end

  def list_people
    puts 'List People Working!'
  end

  def list_books
    puts '***Books***'
    puts "Opps! You don't have any books. Try creating one (option 4)." if @books.empty?
    @books.each do |book|
      puts "#{book.title} by #{book.author}"
    end
  end

  def create_person
    puts 'Create person Working!'
  end

  def create_book
    puts 'Create book Working!'
  end

  def create_rental
    puts 'Create rental Working!'
  end

  def list_rentals
    puts 'List rental Working!'
  end
end
