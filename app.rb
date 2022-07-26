require './classes/listpeople'
require './classes/listbooks'
require './classes/create_student'
require './classes/create_teacher'
require './classes/create_book'
require './classes/create_rental'
require './classes/list_rentals'
require './teacher'
require './student'
require 'json'

class App
  def initialize
    @rentals = []
    @books = []
    @people = []
    @books_path = './json/books.json'
    @people_path = './json/people.json'
    load_data
  end

  def run
    puts 'Welcome to the School Library!'
    until list_options
      input = gets.chomp
      if input == '7'
        puts 'Have good day :)'
        save_data
        break
      end
      option(input)
    end
  end

  def save_data
    save_books
    save_people
  end

  def load_data
    load_books
    load_people
  end

  def load_books
    return unless File.exist?(@books_path)
    return if File.empty?(@books_path)
    books = JSON.parse(File.read(@books_path))
    books.each do |book|
      book = Book.new(book['title'], book['author'])
      @books << book
    end
  end

  def load_people
    return unless File.exist?(@people_path)
    return if File.empty?(@people_path)
    people_data = JSON.parse(File.read(@people_path))
    people_data.each do |person|
      if person.key?('specialization')
        person_data = Teacher.new(person['specialization'], person['age'], person['name'], true)
        @people << person_data
      else
        person_data = Student.new(person['classroom'], person['age'], person['name'], parent_permission: person['parent_permission'])
        @people << person_data
      end
    end
  end

  def save_books
    books_data = []
    @books.each do |book|
      books_data << {title: book.title, author: book.author}
    end
    File.new(@books_path, 'w+') unless File.exist?(@books_path)
    File.write(@books_path, JSON.generate(books_data))
  end

  def save_people
    people_data = []
    @people.each do |person|
      if person.is_a?(Teacher)
        people_data << { specialization: person.specialization, age: person.age, name: person.name, parent_permission: true }
      else
        people_data << { classroom: person.classroom, age: person.age, name: person.name, parent_permission: person.parent_permission  }
      end
    end
    File.new(@people_path, 'w+') unless File.exist?(@people_path)
    File.write(@people_path, JSON.generate(people_data))
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
