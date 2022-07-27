class ListRental
  def initialize(people, rentals)
    @people = people
    @rentals = rentals
  end

  def list
    p @rentals
    puts 'Select person by ID: '
    @people.each do |person|
      puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end
    selected_person = gets.chomp.to_i
    puts 'Rented Books: '
    @rentals.each do |rental|
      next unless rental.book.id == selected_person

      puts "Date: #{rental.date}, Title: #{rental.person.title} Author: #{rental.person.author}"
    end
  end
end
