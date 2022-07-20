class Person
    attr_accessor :name, :age
    attr_reader :id
    def initialize(age, name = "Unkown", parent_permission = true)
        @id = Random.rand(1..1000)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end

    def can_use_services?
        return @parent_permission
    end

    private

    def is_of_age?
        return @age >= 18
    end
end