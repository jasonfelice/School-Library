class ListBooks
  def initialize(data)
    @data = data
  end

  def list
    puts '***Books***'
    puts "Opps! You don't have any books. Try creating one (option 4)." if @data.empty?
    @data.each do |book|
      puts "#{book.title} by #{book.author}"
    end
  end
end
