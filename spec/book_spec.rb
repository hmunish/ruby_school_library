require './classes/book'
require './classes/person'
require './classes/rental'

describe Book do
  context 'When testing the Book class' do
    book = Book.new('Harry Potter', 'J.K.Rowlings')

    it 'should create instance of Book' do
      expect(book).to be_an_instance_of Book
    end

    it 'should create instance with correct title' do
      expect(book.title).to eq 'Harry Potter'
    end

    it 'should create instance with correct author name' do
      expect(book.author).to eq 'J.K.Rowlings'
    end

    it 'should add rental' do
      book.add_rental('2023-06-09', Person.new(25, 'Munish'))
      expect(book.rental[0]).to be_an_instance_of Rental
    end

    it 'should return all instances of Book' do
      expect(Book.all[0]).to be_an_instance_of Book
    end
  end
end
