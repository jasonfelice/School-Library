require './student'

class CreateStudent
  def create
    puts 'Name: '
    student_name = gets.chomp
    puts 'Age: '
    student_age = gets.chomp
    puts 'Parent permission (y/n)'
    student_permission = gets.chomp.strip.upcase
    case student_permission
    when 'Y'
      student_permission = true
    when 'N'
      student_permission = false
    else
      puts "I don't understand..."
    end

    current_student = Student.new('N/A', student_age, student_name, parent_permission: student_permission)
    puts "#{student_name} has been successfully added to the list!"
    current_student
  end
end
