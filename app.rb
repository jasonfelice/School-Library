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
end
