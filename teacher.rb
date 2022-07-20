require './person'

class Teacher < Person
  def initialize(specialization, age, name = 'Unknown', parent_permission)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

teacher = Teacher.new('ass', 33, 'Jake')
