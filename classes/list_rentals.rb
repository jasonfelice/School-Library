class ListRental
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
