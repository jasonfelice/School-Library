require_relative '../classroom'

describe Classroom do
  it 'has a label' do
    classroom = Classroom.new('Mathematics')
    expect(classroom.label).to eq('Mathematics')
  end

  it 'has a student array initialized' do
    classroom = Classroom.new('Mathematics')
    expect(classroom.students).to eq([])
  end
end
