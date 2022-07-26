require 'json'
require './student'
require './reantal'
require './teacher'
require './book'

class Storage
  attr_reader :file_name

  def initialize
    @file_name = %w[rentals.json books.json people.json]
  end

  def create_file
    @file_name.each { |file| File.new(file, 'w+') unless File.exist?(file) }
  end

  def save_data
    create_file
    save_people(App)
    save_books(App)
    save_rentals(App)
  end

  def save_people(data)
    people_data = data.people.map do |person|
      if person.is_a?(Teacher)
        { name: person.name, age: person.age, specialization: person.specialization }
      else
        { classroom: person.classroom, name: person.name, age: person.age, parent_permission: person.parent_permission }
      end
    end
    json_data = JSON.generate(people_data)
    File.write('people.json', json_data)
  end

  def save_books(data)
    books_data = data.books.map do |book|
      { title: book.title, author: book.author }
    end
    json_data = JSON.generate(books_data)
    File.write('books.json', json_data)
  end

  def save_rentals(data)
    rentals_data = data.rentals.map do |rental|
      { date: rental.date, book: rental.book, person: rental.person }
    end
    json_data = JSON.generate(rentals_data)
    File.write('books.json', json_data)
  end

  def load_data
    load_people(App)
    load_books(App)
    load_rentals(App)
  end
end
