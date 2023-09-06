require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'classroom'
require 'json'

class App
  def initialize
    @persons = []
    @books = []
    @rentals = []
    load_data
  end

  def list_books
    Book.all.map { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def list_persons
    Person.all.map { |person| puts "ID: #{person.id} , Name: #{person.name}, Age: #{person.age}" }
  end

  def create_classroom(label)
    Classroom.new(label)
  end

  def create_person(name, age, person_type)
    case person_type
    when 1
      create_student(name, age)
    when 2
      create_teacher(name, age)
    else
      puts 'Invalid choice. Please enter a valid option.'
      execute(3)
    end
    puts 'Person created successfully'
  end

  def create_student(name, age)
    print 'Has parent permission ? [Y/N]: '
    choice = gets.chomp
    if %w[Y y].include?(choice)
      student = Student.new(age, name, parent_permission: true)
    elsif %w[N n].include?(choice)
      student = Student.new(age, name, parent_permission: false)
    end
    @persons << student
  end

  def create_teacher(name, age)
    print 'Specialization: '
    specialization = gets.chomp.to_s
    teacher = Teacher.new(age, specialization, name)
    @persons << teacher
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    Book.all.map.with_index do |book, index|
      puts " (#{index + 1}) Title: #{book.title}, Author: #{book.author}"
    end
    rental_book_index = gets.chomp.to_i
    rental_book = Book.all[rental_book_index - 1]

    puts 'Select a person from the folowing list by number(not id)'
    Person.all.map.with_index do |person, index|
      puts "(#{index + 1}), Name: #{person.name}, Age: #{person.age}"
    end
    rental_person_index = gets.chomp.to_i
    rental_person = Person.all[rental_person_index - 1]

    print 'Date: '
    date = gets.chomp
    rental = Rental.new(date, rental_person, rental_book)
    @rentals << rental
    puts 'Rental created successfully'
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    person = Person.all.select { |x| x.id == id }[0]

    if person
      puts 'Rentals:'
      person.rentals.each { |rental| puts "Date: #{rental.date}, Book: #{rental.book.title}" }
    else
      puts 'Person with the given ID does not exist '
    end
  end

  def save_data
    books = Book.all.map { |book| { title: book.title, author: book.author } }
    people = Person.all.map do |person|
      { id: person.id, age: person.age, name: person.name, rental: [] }
    end
    rentals = Rental.all.map do |rental|
      { date: rental.date, person: { id: rental.person.id, age: rental.person.age, name: rental.person.name },
        book: { author: rental.book.author, title: rental.book.title } }
    end

    # Convert the arrays to JSON strings
    books_json = books.to_json
    people_json = people.to_json
    rentals_json = rentals.to_json

    # Save data in the files
    File.write('books.json', books_json)
    File.write('people.json', people_json)
    File.write('rentals.json', rentals_json)

    puts 'Saved successfully!'
  end

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/Layout/LineLength
  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  def load_data
    if File.exist?('people.json')
      file_data = File.read('people.json')
      people_data = JSON.parse(file_data)
      people_data.map do |data|
        Person.new(data['age'], data['name'], data['id'])
      end
    end
    if File.exist?('books.json')
      file_data = File.read('books.json')
      books_data = JSON.parse(file_data)
      books_data.map do |data|
        Book.new(data['title'], data['author'])
      end
    end
    return unless File.exist?('rentals.json')

    file_data = File.read('rentals.json')
    rentals_data = JSON.parse(file_data)
    rentals_data.map do |data|
      Rental.new(data['date'], Person.all.find { |person| person.id == data['person']['id'] }, Book.all.find do |book|
                                                                                                 book.title == data['book']['title']
                                                                                               end)
    end
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/Layout/LineLength
# rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
