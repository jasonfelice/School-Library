require_relative '../student'

describe Student do 
  it 'is an instance of Student class' do
    student = Student.new('SS1', '65', 'Chidinma', parent_permission: false)
    expect(student).to be_instance_of(Student)
  end

  it 'student with age greater than 18 is allowed to use services' do
    student = Student.new('SS1', '65', 'Chidinma', parent_permission: true)
    expect(student.can_use_services?).to eq(true)
  end

  it 'student classroom to be SS1' do
    student = Student.new('SS1', '17', 'Chidinma', parent_permission: true)
    expect(student.classroom).to eq 'SS1'
  end
end
