require './teacher'
require './student'
require './book'
require './rental'
require './classes/listpeople'
require './classes/listbooks'
require './classes/create_student'

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
    people = ListPeople.new(@people)
    people.list
  end

  def list_books
    books = ListBooks.new(@books)
    books.list
  end

  def create_person
    puts 'Select one of the following options: '
    puts '1 -> Create a teacher.'
    puts '2 -> Create a student.'
    person_option = gets.chomp

    case person_option
    when '1'
      create_teacher
    when '2'
      create_student
    else
      puts "I don't understand..."
    end
  end

  def create_student
    student = CreateStudent.new.create
    @people << student
  end

  def create_teacher
    puts 'Teacher\'s Name: '
    name = gets.chomp
    puts 'Teacher\'s Age: '
    age = gets.chomp.to_i
    puts 'Teacher\'s Specialization'
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name)
    @people << teacher
    puts "#{name} has been successfully added to the list!"
  end

  def create_book
    puts 'Book Title: '
    title = gets.chomp
    puts 'Book Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts "'#{title}' by '#{author}' has been successfully added to the book list"
  end

  def create_rental
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
    @rentals << rental
    puts 'Rental has been created successfully and added to the list.'
  end

  def list_rentals
    puts 'Select person by ID: '
    @people.each do |person|
      puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end
    selected_person = gets.chomp.to_i
    puts 'Rented Books: '
    @rentals.each do |rental|
      next unless rental.person.id == selected_person

      puts "Date: #{rental.date}, Title: #{rental.book.title} Author: #{rental.book.author}"
    end
  end
end
