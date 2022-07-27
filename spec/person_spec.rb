require_relative '../person'

describe Person do
  it 'has a name' do
    person = Person.new(65, 'Chidinma')
    expect(person.name).to eq('Chidinma')
  end

  it 'has age' do
    person = Person.new(65, 'Chidinma')
    expect(person.age).to eq(65)
  end

  it 'can use service' do
    person = Person.new(65, 'Chidinma')
    expect(person.can_use_services?).to eq(true)
  end
end
