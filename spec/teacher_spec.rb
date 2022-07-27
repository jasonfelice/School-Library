require_relative '../teacher'

describe Teacher do
  it 'is an instance of Teacher Class' do
    teacher = Teacher.new('Engineer', 65, 'Chidinma')
    expect(teacher).to be_instance_of(Teacher)
  end

  it 'a teacher can use service regardless of age' do
    teacher = Teacher.new('Engineer', 65, 'Chidinma')
    expect(teacher.can_use_services?).to eq(true)
  end
end