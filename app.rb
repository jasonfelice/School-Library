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
    puts '***People***'
    puts "Opps! Can't find anyone. Create a person (option 3)." if @books.empty?
    @people.each do |person|
      puts "#{person.name} by #{person.age}"
    end
  end

  def list_books
    puts '***Books***'
    puts "Opps! You don't have any books. Try creating one (option 4)." if @books.empty?
    @books.each do |book|
      puts "#{book.title} by #{book.author}"
    end
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
