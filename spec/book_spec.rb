require_relative '../book'

describe Book do 
  it 'has a title' do
    book = Book.new('Subtle Art', 'Mark Manson')
    expect(book.title).to eq('Subtle Art')
  end
  it 'has an author' do
    book = Book.new('Subtle Art', 'Mark Manson')
    expect(book.author).to eq('Mark Manson')
  end
end