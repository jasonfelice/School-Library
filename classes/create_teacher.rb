require './teacher'

class CreateTeacher
  def create
    puts 'Teacher\'s Name: '
    name = gets.chomp
    puts 'Teacher\'s Age: '
    age = gets.chomp.to_i
    puts 'Teacher\'s Specialization'
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name)
    puts "#{name} has been successfully added to the list!"
    teacher
  end
end
