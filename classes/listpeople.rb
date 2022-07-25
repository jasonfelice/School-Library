class ListPeople
  def initialize(data)
    @data = data
  end

  def list
    puts '***People***'
    puts "Opps! Can't find anyone. Create a person (option 3)." if @data.empty?
    @data.each do |person|
      puts "Name: #{person.name} Age:#{person.age}"
    end
  end
end
