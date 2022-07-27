require_relative '../student'
require_relative '../book'
require_relative '../rental'

describe Rental do
  it 'is an instance of Rental class' do
    student = Student.new('SS1', '65', 'Chidinma', parent_permission: true)
    book = Book.new('Subtle Art', 'Mark Manson')
    rental = Rental.new('2022/09/10', book, student)
    expect(rental).to be_instance_of(Rental)
  end
end
