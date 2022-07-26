require './classes/listpeople'
require './classes/listbooks'
require './classes/create_student'
require './classes/create_teacher'
require './classes/create_book'
require './classes/create_rental'
require './classes/list_rentals'

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
        p @people
        File.write('./json/people.json', @people)
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
    teacher = CreateTeacher.new.create
    @people << teacher
  end

  def create_book
    book = CreateBook.new.create
    @books << book
  end

  def create_rental
    rental = CreateRental.new(@books, @people).create
    @rentals << rental
  end

  def list_rentals
    rentals = ListRental.new(@people, @books)
    rentals.list
  end
end
