require './rental'

class CreateRental
  def initialize(books, people)
    @books = books
    @people = people
  end

  def create
    puts 'Select a book by its ID: '
    @books.each_with_index do |book, index|
      puts "ID: #{index}, Title: #{book.title}, Author: #{book.author}"
    end
    selected_book = gets.chomp.to_i
    puts 'Select a person by ID: '
    @people.each_with_index do |person, index|
      puts "ID: #{index}, Name: #{person.name}, Age: #{person.age}"
    end
    selected_person = gets.chomp.to_i
    puts 'Rental start date (yyyy/mm/dd): '
    date = gets.chomp.to_s
    rental = Rental.new(date, @books[selected_book], @people[selected_person])
    puts 'Rental has been created successfully and added to the list.'
    rental
  end
end
