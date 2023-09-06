require_relative 'nameable'
require_relative 'trimmer_decorator'
require_relative 'capitalize_decorator'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name = 'Unknown', id = 'unset', parent_permission: true)
    super()
    @id = if id == 'unset'
            Random.rand(1..1000)
          else
            id
          end
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age && @age >= 18
  end

  def add_rental(date, book)
    Rental.new(date, self, book)
  end
end

# person = Person.new(22, 'maximilianus')
# person.correct_name
# capitalized_person = CapitalizeDecorator.new(person)
# puts capitalized_person.correct_name
# capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
# puts capitalized_trimmed_person.correct_name
