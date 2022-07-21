class Nameable
  def correct_name
    raise NotImplementedError, 'correct_name must be defined in subclass'
  end
end
