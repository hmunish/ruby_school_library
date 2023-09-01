class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @person = person
    @book = book
    @date = date
    person.rentals << self
    book.rental << self
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end
end
